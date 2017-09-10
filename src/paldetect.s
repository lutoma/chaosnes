;
; TV system detection code, mark 2
; Copyright 2017 Damian Yerrick
; (Insert zlib license here)
;

;
; Uses the length from one frame to the next to detect NTSC, PAL
; NES, or Dendy in 41 bytes.  This is slightly bigger than the old
; NMI-dependent detection used since Pently 3 (2011, Thwaite),
; but it also does all the vblank waiting needed for PPU warm-up,
; saving an estimated 13 init code bytes.
;
.p02
.export getTVSystem

.code
.align 8
;;
; Waits for 1284*y + 5*x cycles + 5 cycles, minus 1284 if x is
; nonzero, and then reads bit 7 and 6 of the PPU status port.
; @param X fine period adjustment
; @param Y coarse period adjustment
; @return N=NMI status; V=sprite 0 status; X=Y=0; A unchanged
.proc wait1284y
  dex
  bne wait1284y
  dey
  bne wait1284y
  bit $2002
  rts
.endproc

;;
; Waits for the PPU to stabilize and returns which TV system
; is in use.  Assumes NMI is disabled.
; @return A is 0 for NTSC or RGB, 1 for PAL NES, or 2 for Dendy and
; similar PAL famiclones designed for compatibility with NTSC games
.proc getTVSystem
  ; Pressing Reset during vertical blanking (vblank) on a toploader
  ; leaves NMI unacknowledged, causing vwait1 loop to be skipped.
  ; So acknowledge NMI.
  bit $2002  

  ; Wait for the start of vblank at the bottom of a frame.
  ; This may occasionally miss a frame due to a race in the PPU;
  ; this is harmless.
  vwait1:
    bit $2002
    bpl vwait1
  
  ; The PPU is stable at the end of a vblank.  Determining the TV
  ; system takes slightly longer than that: into the post-render
  ; or vblank below the second frame.
  ;
  ; NTSC: 29780 cycles, 23.19 loops.  Will end in vblank
  ; PAL NES: 33247 cycles, 25.89 loops.  Will end in vblank
  ; Dendy: 35464 cycles, 27.62 loops.  Will end in post-render
  ldx #0
  ldy #24
  jsr wait1284y
  bpl not_ntsc
    ; Another vblank happened within 24 loops.
    ; It must be NTSC.
    tya
    rts
  not_ntsc:

  lda #1
  ldy #3
  jsr wait1284y
  
  ; If another vblank happened by 27 loops, we're on a PAL NES.
  ; Otherwise, we're on a Dendy (PAL famiclone).
  bmi not_dendy
    asl a
  not_dendy:
  rts
.endproc