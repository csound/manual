<CsoundSynthesizer>
<CsOptions>
  -o dac
</CsOptions>
<CsInstruments>

sr     = 44100
ksmps  = 128
nchnls = 2
0dbfs  = 1.0

instr 1
  x:k = randh(2, 1)
  x2:k = sclagud(x, 1.0, 0.1, 1)
  printks("x %f  x2 %f\n", 0.1, x, x2)
endin

instr 2
  midis:k[] = fillarray(60, 65, 60, 65, 60)
  len:i = lenarray(midis)
  ndx:k = int(linseg(0, len*2, len-0.00000001))
  midi:k = mtof(midis[ndx])
  freq:a = sclagud(a(midi), 1, 0.1)
  a0 = oscili(0.7, freq)
  freq1:k = sclagud(midi, 1, 0.1)
  a1 = oscili(0.7, freq1)
  out(a0, a1)
endin

</CsInstruments>
<CsScore>
i 1 0 10
i 2 0 12

</CsScore>
</CsoundSynthesizer>

