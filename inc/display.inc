.importzp text_offset
.importzp screen_offset

; Sets tile A at the position specified in X (high byte), Y (low byte).
.macro set_tile
	; Position is 16 bit. First push high byte from X, then low byte from Y
	stx PPU_ADDR
	sty PPU_ADDR
	ppu_scroll 0, 0
	sta PPU_DATA
.endmacro

; Writes specified string at position in X, Y
; This really shouldn't all be a macro as it wastes a ton of ROM space.
; But it's really quite tricky to put this into a reusable subroutine because
; we have to pass the pointer to the string somehow. FIXME.
.macro write_text string, pos_high, pos_low
	lda #pos_low
	sta screen_offset

	lda #0
	sta text_offset

@loop:
	; Fix message screen offset pointer:
	lda #pos_high
	sta PPU_ADDR
	lda screen_offset	; Get current screen offset.
	inc screen_offset	; Increment screen offset variable, for next time.
	sta PPU_ADDR
	ppu_scroll 0, 0

	; Write next character of message:
	ldx text_offset		; Get message offset.
	inc text_offset		; Increment message offset source.
	lda string,x		; Get message character.
	beq @return			; A=0 => End of message.

	cmp #$20			; Skip spaces
	beq @loop

	sta PPU_DATA		; Write the character.

	wait_for_nmi
	jmp @loop

@return:
.endmacro