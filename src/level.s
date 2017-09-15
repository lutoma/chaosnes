.include "nes.inc"
.include "nesdefs.inc"
.include "helpers.inc"
.include "pently.inc"

.importzp nmi_counter

.rodata
; Format (for now):
; 0 = End of map
; 1 = Empty tile / walkway
; 2 = Wall
map_data:
	.byt 1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1
	.byt 1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1
	.byt 1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1
	.byt 1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1
	.byt 1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1
	.byt 1,1,1,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,0

.zeropage
screen_offset_low:	.res 1
screen_offset_high:	.res 1
in_level:			.res 1
map_offset:			.res 1

.proc level
.code
.export render_level

; Show the character at the stored position
render_character:
	lda screen_offset_high
	sta PPU_ADDR
	lda screen_offset_low
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
	lda screen_offset_high
	sta PPU_ADDR
	lda screen_offset_low
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
	inc screen_offset_low
	jmp paint

move_left:
	dec screen_offset_low
	jmp paint

move_down:
	lda #31					; One line is 32 chars wide
	adc screen_offset_low	; Add screen_offset_low w/ 31 in A
	sta screen_offset_low	; Store computed result in screen_offset_low
	bcs @carry				; Branch on overflow (carry bit set)
	jmp paint
@carry:
	inc screen_offset_high	; On overflow in lower byte, increase higher byte
	jmp paint

move_up:
	lda screen_offset_low	; Load screen offset in A as sbc substracts its value from A, not other way around
	sbc #32
	bcc @carry
	sta screen_offset_low
	jmp paint
@carry:
	lda #(32*7)				; Set low byte to (32*7) + previous offset as one high byte decrease is 8 lines
	adc screen_offset_low	; Now add the old offset to get the correct position within the eighth line
	sta screen_offset_low
	dec screen_offset_high	; Decrease high byte of screen offset
	jmp paint

paint:
	; Paint new character
	jsr render_character

return:
	rts

render_level:
	; Load map
	lda #0
	sta map_offset
@loop:
	; Get next tile of map:
	ldx map_offset		; Get map offset.
	lda map_data,x		; Get map tile
	beq @map_done		; A=0 => End of map

	; 1 = Empty block / don't draw
	cmp #1
	beq @loop

	ldy #$22
	sty PPU_ADDR
	stx PPU_ADDR
	ppu_scroll 0, 0		; Clobbers X, but not A

	sta PPU_DATA		; Write the character.

	inc map_offset		; Increment map offset
	wait_for_nmi
	jmp @loop

@map_done:
	; Set default position
	lda #120
	sta screen_offset_low
	lda #$20
	sta screen_offset_high

	jsr render_character

	; Set in_level to 1 to enable controller input above
	lda #1
	sta in_level

	rts
.endproc