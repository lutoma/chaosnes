.include "nes.inc"
.include "nesdefs.inc"
.include "helpers.inc"
.include "pently.inc"
.include "display.inc"

.importzp nmi_counter

.proc intro
.rodata
; Export the intro palette as we already set it in main.s
.export intro_palette
intro_palette:
; Colours available in the NES palette are:
; http://bobrost.com/nes/files/NES_Palette.png
.repeat 2
	pal $0f,	$16, $2A, $12	; $0f (black), $16 (red), $2A (green), $12 (blue).
	pal 		$16, $28, $30	; $16 (red), $28 (yellow), $3A (very light green).
	pal 		$00, $10, $20	; Grey; light grey; white.
	pal 		$25, $37, $27	; Pink; light yellow; orange.
.endrepeat

rzl_presents:
	    ; 01234567890123456789012345678901
	.byt "  RaumZeitLabor Entertainment   "
	.byt "            presents            "
	.byt "                                "
	.byt "    code by lutoma & silsha     "
	.byt "       graphics by silsha       ",0

.code
.export intro
intro:
	; Wait 1s (60 frames at 60Hz):
	nmi_delay 60

	lda #0				; First song
	jsr pently_start_music

	write_text rzl_presents, $20, (32*2)

message_done:
	; Wait for a while
	nmi_delay 255

	; Scroll off screen:
	ldx #0

@scroll_loop:
	cpx #((8*8)<<1)		; Scroll by 64 scanlines (8 lines), using lower bit to halve the speed.
	beq intro_end		; Reached our target scroll limit.
	wait_for_nmi
	lda #0
	sta PPU_SCROLL		; X scroll is still 0.
	txa
	lsr a				; Discard lower bit.
	sta PPU_SCROLL		; Y scroll is upper 6 bits of X register.
	inx					; Increment scroll counter.
	jmp @scroll_loop

intro_end:
	; Clean up after us
	clear_vram 0, 1
	ppu_scroll 0, 0

	rts
.endproc