.include "nes.inc"
.include "nesdefs.inc"
.include "helpers.inc"

; http://wiki.nesdev.com/w/index.php/NSF

.proc nsfplayer
.code

; Force specific code location
.org $a703
	; Start including at 0x080 to skip NSF header. Only works because bank switching isn't used.
	.incbin "sound/intro.nsf",080h
; Don't care about code location anymore
.reloc

.export play_nsf
play_nsf:
	; Initialize sound registers
	;ldx #0
	;lda #4000


	sta 4000h

	lda #0 ; Song 1
	ldx #1 ; PAL mode (0 would be NTSC)

	; Call NSF init subroutine
	;jsr $b200

	rts

.endproc