<CsoundSynthesizer>

<CsInstruments>
sr = 44100
ksmps = 100
nchnls = 1
0dbfs = 1

instr 1
  a1  oscil  0.9, 10, 1
  a2  median a1, 5, 8
  out a2
endin
</CsInstruments>

<CsScore>
f1 0 4096 10 1
i 1 0 0.1 
e

</CsScore>

</CsoundSynthesizer>