.include "nes.inc"
.include "nesdefs.inc"
.include "helpers.inc"

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

.include "rodata.inc"	; "RODATA" segment; data found in the ROM.

.code
.proc init
init:
	basic_init
	clear_wram
	ack_interrupts
	init_apu
	ppu_wakeup

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

	enable_vblank_nmi

	; Now wait until nmi_counter increments, to indicate the next VBLANK.
	wait_for_nmi
	; By this point, we're in the 3rd VBLANK.

	init_sprites
	trigger_ppu_dma

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

	jsr play_nsf
	jsr intro

; We should never really end up here, but in case we do, loop forever.
;:
;	jmp :-
	jmp ($FFFC) ; Just reset for now during development
.endproc


; NMI ISR.
; Use of .proc means labels are specific to this scope.
.proc nmi_isr
	dec nmi_counter
	rti
.endproc


; IRQ/BRK ISR:
.proc irq_isr
	; Handle IRQ/BRK here.
	rti
.endproc


; =====	CHR-ROM Pattern Tables =================================================

.segment "PATTERN0"
	.incbin "sprites/ascii.chr"
