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
rzl_logo_1:
	.byt 128,129,130,131,132,0
rzl_logo_2:
	.byt 133,134,135,136,137,0
rzl_logo_3:
	.byt 138,139,140,141,142,0
rzl_logo_4:
	.byt 143,144,145,146,147,0
rzl_logo_5:
	.byt 148,149,150,0

rzl_presents:
	    ; 01234567890123456789012345678901
	.byt "  RaumZeitLabor Entertainment   "
	.byt "            presents            "
	.byt "                                "
	.byt "   crafted by lutoma & silsha   ",0

main_logo_1:
	.byt 160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,0
main_logo_2:
	.byt 176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,0
main_logo_3:
	.byt 192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,0

.code
.export intro
intro:
	; Wait 1s (60 frames at 60Hz):
	nmi_delay 60

	lda #0				; First song
	jsr pently_start_music

	write_text rzl_logo_1, $20, (32*3 + 13)
	write_text rzl_logo_2, $20, (32*4 + 13)
	write_text rzl_logo_3, $20, (32*5 + 13)
	write_text rzl_logo_4, $20, (32*6 + 13)
	write_text rzl_logo_5, $20, (32*7 + 13)
	write_text rzl_presents, $21, (32*3)
	write_text main_logo_1, $22, (32*3 + 8)
	write_text main_logo_2, $22, (32*4 + 8)
	write_text main_logo_3, $22, (32*5 + 8)

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