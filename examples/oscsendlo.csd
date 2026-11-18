<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 48
nchnls = 2
0dbfs = 1

instr 1
  kCount = int(timeinsts())
  kFrequency = 220 + 110 * kCount
  oscsendlo(kCount, "127.0.0.1", 7770, "/tone", "if", kCount, kFrequency)
endin
</CsInstruments>
<CsScore>
i 1 0 2.5
e
</CsScore>
</CsoundSynthesizer>
