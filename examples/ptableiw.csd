<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  ptableiw(10, 0, 1)
  tablew(10, 0, 2)
  iOld = table(0, 1)
  iNew = table(0, 2)
  prints "Old name = %.0f, replacement = %.0f\n", iOld, iNew
endin
</CsInstruments>
<CsScore>
f 1 0 -5 -2 0 0 0 0 0
f 2 0 -5 -2 0 0 0 0 0
i 1 0 0.01
e
</CsScore>
</CsoundSynthesizer>
