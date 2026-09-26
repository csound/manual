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
  lp:a, hp:a = zdf1polemode(sig, line(220, p3, 10000))
  sig = (p4 == 0) ? lp : hp
  out(sig, sig)
endin

instr 2 
  sig:a = vco2(0.5, 220)
  lp:a, hp:a = zdf1polemode(sig, line(220, p3, 10000))
  sig = (p4 == 0) ? lp : hp
  out(sig, sig)
endin

</CsInstruments>
<CsScore>
i1 0 4 0
i1 5 4 1
i2 10 4 0
i2 15 4 1
</CsScore>
</CsoundSynthesizer>
