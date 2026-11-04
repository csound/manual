<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  aInput rand 0.05
  ; Three centers: 700, 1000, and 1300 Hz.
  ; The last argument opts into corrected linear spacing.
  aBank resony aInput, 700, 100, 3, 900, 1, 1, 0, 1
  out aBank
endin
</CsInstruments>
<CsScore>
i 1 0 2
e
</CsScore>
</CsoundSynthesizer>
