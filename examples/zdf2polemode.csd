<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr     = 44100 
ksmps  = 1
nchnls = 2
0dbfs  = 1

instr 1 
  sig:a = random(-1.0, 1.0) 
  sigs:a[] = init(3)
  sigs[0], sigs[1], sigs[2] = zdf2polemode(sig, line(20, p3, 10000), 4)
  out(sigs[p4], sigs[p4])
endin

instr 2 
  sig:a = vco2(0.5, 220) 
  sigs:a[] = init(3)
  sigs[0], sigs[1], sigs[2] = zdf2polemode(sig, line(20, p3, 10000), 4 )
  out(sigs[p4], sigs[p4])
endin

</CsInstruments>
<CsScore>
i1 0 4 0
i1 5 4 1
i1 10 4 2

i2 15 4 0
i2 20 4 1
i2 25 4 2

</CsScore>
</CsoundSynthesizer>
