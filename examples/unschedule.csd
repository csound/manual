<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr Tone
  printf_i "Playing %g Hz\n", 1, p4
  aEnvelope linseg 0, 0.01, 0.1, p3 - 0.02, 0.1, 0.01, 0
  aTone poscil aEnvelope, p4
  out aTone
endin

instr 1
  ; Queue two identical notes. Remove one and leave the other to play.
  schedule("Tone", 0.5, 0.25, 440)
  schedule("Tone", 0.5, 0.25, 440)
  unschedule("Tone", 0.5, 0.25, 440)

  ; Remove both 660 Hz notes. The different 880 Hz note stays queued.
  schedule("Tone", 1, 0.25, 660)
  schedule("Tone", 1, 0.25, 660)
  schedule("Tone", 1, 0.25, 880)
  unscheduleall("Tone", 1, 0.25, 660)
endin
</CsInstruments>
<CsScore>
i 1 0 1.5
e
</CsScore>
</CsoundSynthesizer>
