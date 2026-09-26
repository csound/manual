<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac    ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o opcode_f.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
0dbfs =  1
nchnls = 2

; example by Luis Salgueiro and joachim heintz

opcode Transpose, a, fk    ; transpose a monophonic input signal through FFT.
  fsig, kInterval xin
  fScaled pvscale fsig, semitone(kInterval)
  aTransposed pvsynth fScaled
  xout aTransposed
endop

// modern syntax
opcode Transpose2(sig:f,interval:k):a
  scaled:f = pvscale(sig,semitone(interval))
  xout(pvsynth(scaled))
endop

opcode Stretch,f,ik
  iTab, kSpeed xin
  fStretch pvstanal kSpeed, 1, 1, iTab
  xout fStretch
endop

// modern syntax
opcode Stretch2(tab:i,speed:k):f
 xout(pvstanal(speed,1,1,tab))
endop


giFox ftgen 0, 0, 0, 1, "fox.wav", 0, 0, 0

instr 1
  aSnd diskin2 "fox.wav"
  fSnd pvsanal aSnd, 1024, 256, 1024, 1
  aTransposed Transpose fSnd, p4   ; p4 = transposition in semitones
  outall aTransposed/2
endin

instr 2
  fStretch Stretch giFox, transeg:k(1,p3,-3,0)
  aStretch pvsynth fStretch
  outall aStretch
endin


instr 3
  aSnd diskin2 "fox.wav"
  fSnd pvsanal aSnd, 1024, 256, 1024, 1
  aTransposed Transpose2 fSnd, p4   ; p4 = transposition in semitones
  outall aTransposed/2
endin

instr 4
  fStretch Stretch2 giFox, transeg:k(1,p3,-3,0)
  aStretch pvsynth fStretch
  outall aStretch
endin

</CsInstruments>
<CsScore>
i1 0 3 0
i1 . . 7
i1 . . 12
i2 4 8
i3 12 3 0
i3 . . 7
i3 . . 12
i4 16 8
e
</CsScore>
</CsoundSynthesizer>