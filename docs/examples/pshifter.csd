<CsoundSynthesizer>
<CsOptions>
-iadc -odac
; For non-realtime output, replace the line above with:
; -n -o pshifter.wav -W
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1
  ain inch 1
  kpitch linseg 1, 2, 1.5, 2, 0.75
  kfscal linseg 1, 2, 2, 2, 1
  klock = 2
  kkeepform = 1

  asig, idel pshifter ain, kpitch, kfscal, klock, kkeepform, 1024, 4
  adry delayr idel
        delayw ain
  aout = 0.7*asig + 0.3*adry
       out aout, aout
endin

</CsInstruments>
<CsScore>
i 1 0 4
e
</CsScore>
</CsoundSynthesizer>
