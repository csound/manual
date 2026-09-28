<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr     = 48000
ksmps  = 1
nchnls = 2
0dbfs  = 1

instr 1 
  sig:a = random(-1.0, 1.0) 
  sig = zdf1pole(sig, line(220, p3, 10000), p4)
  out(sig, sig)
endin

instr 2 
  sig:a = vco2(0.5, 220)
  sig = zdf1pole(sig, line(220, p3, 10000), p4)
  out(sig, sig)
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
