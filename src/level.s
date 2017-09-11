.include "nes.inc"
.include "nesdefs.inc"
.include "helpers.inc"
.include "pently.inc"

.importzp nmi_counter

.rodata
game_palette:
.repeat 2
	pal $09,	$16, $2A, $12	; $09 (dark plant green), $16 (red), $2A (green), $12 (blue).
	pal 		$16, $28, $3A	; $16 (red), $28 (yellow), $3A (very light green).
	pal 		$00, $10, $20	; Grey; light grey; white.
	pal 		$25, $37, $27	; Pink; light yellow; orange.
.endrepeat

.zeropage
screen_offset:	.res 1
in_level:		.res 1

.proc level
.code
.export render_level

; Show the character at the position in A
render_character:
	; Store A for later
	pha

	lda #$20			; Hi-byte of $2000
	sta PPU_ADDR
	pla					; Get position from A
	sta PPU_ADDR
	ppu_scroll 0, 0

	lda #16
	sta PPU_DATA
	rts

; Move character according to button press
.export move_character
move_character:
	; Check if we're even in the level yet (or still in the intro)
	lda in_level
	beq return

	; Remove old character
	lda #$20			; Hi-byte of $2000
	sta PPU_ADDR
	lda screen_offset
	sta PPU_ADDR
	ppu_scroll 0, 0
	lda #0
	sta PPU_DATA

	; Get button state
	lda buttons
	cmp #%00000001
	beq move_right

	cmp #%00000010
	beq move_left

	cmp #%00000100
	beq move_down

	cmp #%00001000
	beq move_up

	; No valid button press, jump right to the paint function
	; to redraw in the previous position
	; (Should probably be optimized to not redraw at all then)
	jmp paint

move_right:
	inc screen_offset
	jmp paint

move_left:
	dec screen_offset
	jmp paint

move_down:
	lda #31				; One line is 32 chars wide
	adc screen_offset	; FIXME should handle overflows with carry bit
	sta screen_offset
	jmp paint

move_up:
	lda #31				; One line is 32 chars wide
	sbc screen_offset	; FIXME should handle overflows with carry bit
	sta screen_offset
	bcc @overflow		; Overflow
	jmp paint

	; In case of overflow, set line to 0
@overflow:
	lda #50
	sta screen_offset
	jmp paint


paint:
	; Paint new character
	lda screen_offset
	jsr render_character

return:
	rts

render_level:
	load_palettes game_palette

	lda #120
	sta screen_offset
	jsr render_character

	; Set in_level to 1 to enable controller input above
	lda #1
	sta in_level

	rts
.endproc