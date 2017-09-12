.include "nes.inc"
.include "nesdefs.inc"
.include "helpers.inc"
.include "pently.inc"

.importzp nmi_counter

.proc main_menu
.segment "ZEROPAGE"
msg_ptr:		.res 1	; Points to the next character to fetch from a message.
screen_offset:	.res 1	; Points to the next screen offset to write.

.rodata
; Export the intro palette as we already set it in main.s
press_start:
	    ; 01234567890123456789012345678901
	.byt "          Press Start           ",0

.code
.export main_menu
main_menu:
	; Wait 1s (60 frames at 60Hz):
	nmi_delay 60

	; This seems unnecessary as we already do clear_vram in main.s. Maybe it's required to
	; clear the VRAM again, but after the third frame. But even then, this should probably
	; be in main.s and use the clear_vram instead.
	; As it also works without all this stuff (at least in FCEUX), it's commented for now.

;	; Clear lines 2-6 of the nametable (i.e. skip first 32*2 tiles, clear next 32*4 tiles):
;	ppu_addr $2000+(32*2)
;	lda #0
;	ldx #(32*4/4)		; NOTE: 4 x "STA" instructions make this loop faster.
;:	Repeat 4, sta PPU_DATA
;	dex
;	bne :-

	; Now fix the palettes for the above 4 lines (2-6) that we just cleared:
	; NOTE: There are 4 actual rows to a metarow. 1 metarow is 8 bytes across.
	; Hence, setting the palettes for rows 2-6 requires that we rewrite both
	; metarows 0 and 1 (which covers actual rows 0-3, and 4-7, respectively).
;	ppu_addr $23c0 		; Select 1st metarow (rows 0-3; we'll then do 4-7).
;	ldx #(16/4)			; Fill two metarows (8 bytes each), which covers 8 actual rows.
;	lda #%01010101		; Both the upper rows (bits 0-3) and the lower rows (bits 4-7) get pallete 1 (%01 x 4).
;:	Repeat 4, sta PPU_DATA
;	dex
;	bne :-

	; Point screen offset counter to start of line 2:
	lda #(32*2)
	sta screen_offset

	; Point to start of source message:
	lda #0
	sta msg_ptr

	; Fix scroll position:
	; NOTE: We have to do this after writing to VRAM, because scroll position seems
	; to automatically track the VRAM target address. For a possible explanation of this, see:
	; http://wiki.nesdev.com/w/index.php/The_skinny_on_NES_scrolling
	;ppu_scroll 0, 0

char_loop:
	; Fix message screen offset pointer:
	lda #$22			; Hi-byte of $2000
	sta PPU_ADDR
	lda screen_offset	; Get current screen offset.
	inc screen_offset	; Increment screen offset variable, for next time.
	sta PPU_ADDR
	ppu_scroll 0, 0

	; Write next character of message:
	ldx msg_ptr			; Get message offset.
	inc msg_ptr			; Increment message offset source.
	lda press_start,x		; Get message character.
	beq wait_for_input	; A=0 => End of message.
	sta PPU_DATA		; Write the character.

	cmp #$20			; Ascii 20 = space
	beq @wait_write		; Skip typing effect for spaces.
	nmi_delay 2 		; Wait for 30ms (2 frames at 60Hz):

	; Even for space characters, we need to wait for at least one NMI, or else
	; the rendering will get b0rked.
@wait_write:
	wait_for_nmi
	jmp char_loop		; Go process the next character.

wait_for_input:
	; Get button state
	lda buttons
	cmp #%00010000
	bne wait_for_input

menu_done:
	; Clean up after us
	clear_vram 0, 4
	ppu_scroll 0, 0
	wait_for_nmi
	rts
.endproc