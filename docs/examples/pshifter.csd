<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1
  ipitch = p4
  ikeepform = p5
  prints "pitch %.2f, keepform %.0f\n", ipitch, ikeepform
  ain soundin "fox.wav"
  aout, idel pshifter ain, ipitch, 1, 0, ikeepform
  aenv linen 0.8, 0.02, p3, 0.05
       outs aout*aenv, aout*aenv
endin

</CsInstruments>
<CsScore>
i1 0 2.9 1.25 0
i1 3.0 2.9 1.5 0
i1 6.0 2.9 1.75 0
i1 9.0 2.9 2 0
i1 12.0 2.9 1.25 1
i1 15.0 2.9 1.5 1
i1 18.0 2.9 1.75 1
i1 21.0 2.9 2 1
i1 24.0 2.9 1.25 2
i1 27.0 2.9 1.5 2
i1 30.0 2.9 1.75 2
i1 33.0 2.9 2 2
e 36.2
</CsScore>
</CsoundSynthesizer>
