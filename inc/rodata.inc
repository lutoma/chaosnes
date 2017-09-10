; Program data (read-only)
.segment "RODATA"

intro_palette:
; Colours available in the NES palette are:
; http://bobrost.com/nes/files/NES_Palette.png
.repeat 2
	pal $0f,	$16, $2A, $12	; $0f (black), $16 (red), $2A (green), $12 (blue).
	pal 		$16, $28, $30	; $16 (red), $28 (yellow), $3A (very light green).
	pal 		$00, $10, $20	; Grey; light grey; white.
	pal 		$25, $37, $27	; Pink; light yellow; orange.
.endrepeat

game_palette:
.repeat 2
	pal $09,	$16, $2A, $12	; $09 (dark plant green), $16 (red), $2A (green), $12 (blue).
	pal 		$16, $28, $3A	; $16 (red), $28 (yellow), $3A (very light green).
	pal 		$00, $10, $20	; Grey; light grey; white.
	pal 		$25, $37, $27	; Pink; light yellow; orange.
.endrepeat
