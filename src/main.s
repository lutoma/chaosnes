.include "nes.inc"
.include "nesdefs.inc"
.include "helpers.inc"

.importzp buttons

.segment "INESHDR"
	.byt "NES",$1A
	.byt 1 				; 1 x 16kB PRG block.
	.byt 1 				; 1 x 8kB CHR block.
	; Rest of iNES header defaults to 0, indicating mapper 0, standard RAM size, etc.

; Interrupt vectors
.segment "VECTORS"
	.addr nmi_isr, init, irq_isr

.zeropage
	.export nmi_counter
	; Counts DOWN for each NMI.
	nmi_counter: .res 1

	.export pently_zptemp
	pently_zptemp: .res 5

	.export tvSystem
	tvSystem: .res 1

	; These are used in the display.inc write_text macro
	.export text_offset
	.export screen_offset
	text_offset:	.res 1		; Points to the next character to fetch from a message.
	screen_offset:	.res 1		; Points to the next screen offset to write.


.code
.proc init
init:
	; Basic init
	; Disable interrupts:
	sei
	; Disable 'decimal' mode (because the NES CPU doesn't support it):
	cld
	; Basic init:
	ldx #0
	stx PPU_CTRL		; General init state; NMIs (bit 7) disabled.
	stx PPU_MASK		; Disable rendering, i.e. turn off background & sprites.
	stx APU_DMC_CTRL	; Disable DMC IRQ.

	; Set stack pointer:
	dex 				; X = $FF
	txs					; Stack pointer = $FF

	; Clear WRAM, including zeropage; probably not strictly necessary
	; (and creates a false sense of security) but it DOES ensure a clean
	; state at power-on and reset.
	; WRAM ("Work RAM") is the only general-purpose RAM in the NES.
	; It is 2KiB mapped to $0000-$07FF.
	ldx #0
	txa
:	sta $0000, X 		; This line, in the loop, will clear zeropage.
	sta $0100, X
	sta $0200, X
	sta $0300, X
	sta $0400, X
	sta $0500, X
	sta $0600, X
	sta $0700, X
	inx
	bne :-

	; Clear lingering interrupts since before reset:
	bit PPU_STATUS		; Ack VBLANK NMI (if one was left over after reset); bit 7.
	bit APU_CHAN_CTRL	; Ack DMC IRQ; bit 7

	; Init APU:
	lda #$40
	sta APU_FRAME		; Disable APU Frame IRQ
	lda #$0F
	sta APU_CHAN_CTRL	; Disable DMC, enable/init other channels.

	; PPU warm-up: Wait 1 full frame for the PPU to become stable, by watching VBLANK.
	; NOTE: There are 2 different ways to wait for VBLANK. This is one, recommended
	; during early startup init. The other is by the NMI being triggered.
	; For more information, see: http://wiki.nesdev.com/w/index.php/NMI#Caveats
	; Instead of waiting for PPU_STATUS ourselves, we let pently take care of it.
	; This will also detect whether we run on a PAL or NTSC system.
	jsr getTVSystem
	sta tvSystem
	; First PPU frame has reached VBLANK.

	; NOTE: "bit PPU_STATUS" reads the bit, but actually clears it in the process too,
	; so we can loop on checking it a second time:

	; Wait for second VBLANK:
:	bit PPU_STATUS
	bpl :-
	; VLBANK asserted: PPU is now fully stabilised.

	; We're in VBLANK for a short while, so do video prep now...
	load_palettes intro_palette

	; Clear all 4 nametables (i.e. start at nametable 0, and clear 4 nametables):
	clear_vram 0, 4

	; Fill attribute tables, for nametable 0, with palette %01
	; (for all 4 palettes, hence %01010101 or $55):
	lda #$55			; Select palette %01 (2nd palette) throughout.
	fill_attribute_table 0
	fill_attribute_table 2
	; These two are done because 0 and 2 are stacked vertically,
	; due to the INES header selecting horizontal mirroring in this case.

	; Activate VBLANK NMIs.
	lda #VBLANK_NMI
	sta PPU_CTRL

	; Now wait until nmi_counter increments, to indicate the next VBLANK.
	wait_for_nmi
	; By this point, we're in the 3rd VBLANK.

	; Move all sprites below line 240, so they're hidden.
	; Here, we PREPARE this by loading $0200-$02FF with data that we will transfer,
	; via DMA, to the NES OAM (Object Attribute Memory) in the PPU. The DMA will take
	; place after we know the PPU is ready (i.e. after 2nd VBLANK).
	; NOTE: OAM RAM contains 64 sprite definitions, each described by 4 bytes:
	;	byte 0: Y position of the top of the sprite.
	;	byte 1: Tile number.
	;	byte 2: Attributes (inc. palette, priority, and flip).
	;	byte 3: X position of the left of the sprite.
	ldx #0
	lda #$FF
:	sta OAM_RAM,x	; Each 4th byte in OAM (e.g. $00, $04, $08, etc.) is the Y position.
	Repeat 4, inx
	bne :-

	; Trigger DMA to copy from local OAM_RAM ($0200-$02FF) to PPU OAM RAM.
	; For more info on DMA, see: http://wiki.nesdev.com/w/index.php/PPU_OAM#DMA
	lda #0
	sta PPU_OAM_ADDR	; Specify the target starts at $00 in the PPU's OAM RAM.
	lda #>OAM_RAM		; Get upper byte (i.e. page) of source RAM for DMA operation.
	sta OAM_DMA			; Trigger the DMA.
	; DMA will halt the CPU while it copies 256 bytes from $0200-$02FF
	; into $00-$FF of the PPU's OAM RAM.

	; Set X & Y scrolling positions (which have ranges of 0-255 and 0-239 respectively):
	ppu_scroll 0, 0

	; Configure PPU parameters/behaviour/table selection:
	lda #VBLANK_NMI|BG_0|SPR_0|NT_0|VRAM_RIGHT
	sta PPU_CTRL

	; Turn the screen on, by activating background and sprites:
	lda #BG_ON|SPR_ON
	sta PPU_MASK

	; Wait until the screen refreshes.
	wait_for_nmi

	jsr pently_init
	jsr intro
	jsr main_menu
	jsr render_level

; Loop forever while we wait for interrupts
:
	nop
	nop
	jmp :-
.endproc


; NMI ISR.
; Use of .proc means labels are specific to this scope.
.proc nmi_isr
	dec nmi_counter
	txa
	pha
	jsr pently_update
	pla
	tax

	; Temporary – Should probably only be checked on the right IRQs
	; Play sound effect if any button is pressed
	jsr readjoy
	lda buttons
	beq end_nmi
	jsr move_character

end_nmi:
	rti
.endproc


; IRQ/BRK ISR:
.proc irq_isr
	rti
.endproc

; CHR-ROM Pattern Tables
.segment "PATTERN"
	.incbin "sprites/tiles.chr"
