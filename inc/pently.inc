;
; Pently audio engine
; Public API
;
; Copyright 2015-2016 Damian Yerrick
; 
; This software is provided 'as-is', without any express or implied
; warranty.  In no event will the authors be held liable for any damages
; arising from the use of this software.
; 
; Permission is granted to anyone to use this software for any purpose,
; including commercial applications, and to alter it and redistribute it
; freely, subject to the following restrictions:
; 
; 1. The origin of this software must not be misrepresented; you must not
;    claim that you wrote the original software. If you use this software
;    in a product, an acknowledgment in the product documentation would be
;    appreciated but is not required.
; 2. Altered source versions must be plainly marked as such, and must not be
;    misrepresented as being the original software.
; 3. This notice may not be removed or altered from any source distribution.
;

; Configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; These default values are used if pentlyconfig.inc is not included.

; Enable tvSystem-driven correction for PAL NES and Dendy
.ifndef PENTLY_USE_PAL_ADJUST
PENTLY_USE_PAL_ADJUST = 1
.endif

; Enable row callbacks
.ifndef PENTLY_USE_ROW_CALLBACK
PENTLY_USE_ROW_CALLBACK = 0
.endif

; Enable vibrato (sinusoidal pitch modulation with an LFO of
; period 12 frames)
.ifndef PENTLY_USE_VIBRATO
PENTLY_USE_VIBRATO = 1
.endif

; Enable arpeggio (rapid pitch modulation producing warbly chords of
; period 2 or 3 frames)
.ifndef PENTLY_USE_ARPEGGIO
PENTLY_USE_ARPEGGIO = 1
.endif

; Enable vibrato (sinusoidal pitch modulation with an LFO of
; period 12 frames)
.ifndef PENTLY_USE_PORTAMENTO
PENTLY_USE_PORTAMENTO = 1
.endif

; Enable attack envelopes on instruments
.ifndef PENTLY_USE_ATTACK_PHASE
PENTLY_USE_ATTACK_PHASE = 1
.endif

; Enable a fifth track that can inject attacks on top of the
; pulse 1, pulse 2, or triangle channel
.ifndef PENTLY_USE_ATTACK_TRACK
PENTLY_USE_ATTACK_TRACK = PENTLY_USE_ATTACK_PHASE
.endif

.assert (!PENTLY_USE_ATTACK_TRACK) || PENTLY_USE_ATTACK_PHASE, error, "cannot use attack track without attack phase"

; Count rows per beat
.ifndef PENTLY_USE_BPMMATH
PENTLY_USE_BPMMATH = 1
.endif

; Methods ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
; Initializes the sound channels and stops all sound effects
; and music.
.global pently_init

;;
; Updates sound registers.  Call this once each frame.
; Overwrites: ???
.global pently_update

;;
; Starts a sound effect.
; @param A the sound effect ID
.global pently_start_sound

;;
; Starts a piece of music.
; @param A the music ID
.global pently_start_music

;;
; Stops the music.
.global pently_stop_music

;;
; Resumes the stopped music.
.global pently_resume_music

;;
; Plays note A on channel X (0, 4, 8, 12) with instrument Y.
; Trashes 0-1 and preserves X.
.global pently_play_note

;;
; Returns the playing position as a fraction of a beat from 0 to 95.
; (Implemented in bpmmath.s)
.global pently_get_beat_fraction

; Fields ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; It's highly discouraged to write to any of these.
; Use the methods above instead.

;;
; Nonzero if music is currently playing
.global pently_music_playing

;;
; The number of rows per beat set by the current music track.
.global pently_rows_per_beat

;;
; The row within a beat, in the range 0 to pently_rows_per_beat
.global pently_row_beat_part

;;
; The fraction of a row until the next row is processed.
; Will range from -3000 to 0 on PAL or -3606 to 0 on NTSC.
.global pently_tempoCounterLo, pently_tempoCounterHi

.global pently_fpmLo, pently_fpmHi
