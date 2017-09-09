.include "nes.inc"
.include "nesdefs.inc"
.include "helpers.inc"

.export init_audio
.segment "CODE"

init_audio:
	; ------ Configure noise channel ------

	; Set noise type and period:
	; 0-------	Pseudo-random noise (instead of random regular waveform).
	; ----1000	Mid-range period/frequency.
	lda #%10001000
	sta APU_NOISE_FREQ	; Noise mode & period (frequency).

	; Set volume control:
	; --0-----	Use silencing timer (makes it one-shot).
	; ---0----	Use volume envelope (fade).
	; ----0000	Envelope length (shortest).
	lda #%00000000		; Very short fade, one-shot.
	sta APU_NOISE_VOL	; Noise channel volume control.

	; Set length counter:
	; 11111---	Maximum timer (though other values seem to have no effect?)
	lda #%11111000
	sta APU_NOISE_TIMER	; Length counter load.

	; Channel control:
	; ----1---	Enable noise channel.
	lda #%00001000
	sta APU_CHAN_CTRL	; Channel control.

	rts