.include "nes.inc"
.include "nesdefs.inc"
.include "helpers.inc"
.include "pently.inc"
.include "display.inc"

.importzp nmi_counter
.proc main_menu
.rodata
press_start:
	    ; 01234567890123456789012345678901
	.byt "          Press Start           ",0

.code
.export main_menu
main_menu:
	; Wait 1s (60 frames at 60Hz):
	nmi_delay 60
	write_text press_start, $22, (32*2)

wait_for_input:
	; Get button state
	lda buttons
	cmp #%00010000
	bne wait_for_input

menu_done:
	jsr pently_stop_music

	; Clean up after us
	clear_vram 0, 4
	ppu_scroll 0, 0
	wait_for_nmi
	rts
.endproc