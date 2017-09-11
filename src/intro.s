.include "nes.inc"
.include "nesdefs.inc"
.include "helpers.inc"
.include "pently.inc"

.importzp nmi_counter

.proc intro
.segment "ZEROPAGE"
msg_ptr:		.res 1	; Points to the next character to fetch from a message.
screen_offset:	.res 1	; Points to the next screen offset to write.

.rodata
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

	; Clear lines 2-6 of the nametable (i.e. skip first 32*2 tiles, clear next 32*4 tiles):
	ppu_addr $2000+(32*2)
	lda #0
	ldx #(32*4/4)		; NOTE: 4 x "STA" instructions make this loop faster.
:	Repeat 4, sta PPU_DATA
	dex
	bne :-

	; Now fix the palettes for the above 4 lines (2-6) that we just cleared:
	; NOTE: There are 4 actual rows to a metarow. 1 metarow is 8 bytes across.
	; Hence, setting the palettes for rows 2-6 requires that we rewrite both
	; metarows 0 and 1 (which covers actual rows 0-3, and 4-7, respectively).
	ppu_addr $23c0 		; Select 1st metarow (rows 0-3; we'll then do 4-7).
	ldx #(16/4)			; Fill two metarows (8 bytes each), which covers 8 actual rows.
	lda #%01010101		; Both the upper rows (bits 0-3) and the lower rows (bits 4-7) get pallete 1 (%01 x 4).
:	Repeat 4, sta PPU_DATA
	dex
	bne :-

	; Point screen offset counter back to start of line 2:
	lda #(32*2)
	sta screen_offset

	; Point back to start of source message:
	lda #0
	sta msg_ptr

	; Fix scroll position:
	; NOTE: We have to do this after writing to VRAM, because scroll position seems
	; to automatically track the VRAM target address. For a possible explanation of this, see:
	; http://wiki.nesdev.com/w/index.php/The_skinny_on_NES_scrolling
	ppu_scroll 0, 0

	; Wait 1s:
	nmi_delay 60

	lda #0				; First song
	jsr pently_start_music

char_loop:
	; Fix message screen offset pointer:
	lda #$20			; Hi-byte of $2000
	sta PPU_ADDR
	lda screen_offset	; Get current screen offset.
	inc screen_offset	; Increment screen offset variable, for next time.
	sta PPU_ADDR
	ppu_scroll 0, 0

	; Write next character of message:
	ldx msg_ptr			; Get message offset.
	inc msg_ptr			; Increment message offset source.
	lda rzl_presents,x		; Get message character.
	beq message_done	; A=0 => End of message.
	sta PPU_DATA		; Write the character.

	cmp #$20			; Ascii 20 = space
	beq @wait_write		; Skip typing effect for spaces.
	nmi_delay 2 		; Wait for 30ms (2 frames at 60Hz):

	; Even for space characters, we need to wait for at least one NMI, or else
	; the rendering will get b0rked.
@wait_write:
	wait_for_nmi
	jmp char_loop		; Go process the next character.

message_done:
	; Wait for a while (currently hardcoded for music duration)
	nmi_delay 255
	nmi_delay 140
	jsr pently_stop_music

	; Scroll off screen:
	ldx #0
	jmp intro_end
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