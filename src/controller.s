.zeropage
; bit:   	 7     6     5     4     3     2     1     0
; button:	 A     B  Select Start  Up   Down  Left  Right
.export buttons
buttons: .res 1

JOYPAD1 = $4016
JOYPAD2 = $4017


.code
; At the same time that we strobe bit 0, we initialize the ring counter
; so we're hitting two birds with one stone here
readjoy:
	lda #$01
	; While the strobe bit is set, buttons will be continuously reloaded.
	; This means that reading from JOYPAD1 will only return the state of the
	; first button: button A.
	sta JOYPAD1
	sta buttons
	lsr a        ; now A is 0
	; By storing 0 into JOYPAD1, the strobe bit is cleared and the reloading stops.
	; This allows all 8 buttons (newly reloaded) to be read from JOYPAD1.
	sta JOYPAD1
loop:
	lda JOYPAD1
	lsr a	       ; bit0 -> Carry
	rol buttons  ; Carry -> bit0; bit 7 -> Carry
	bcc loop
	rts