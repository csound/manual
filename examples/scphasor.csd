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
  rate:k = linseg(1, p3, 40)
  trig:k = metro(rate)
  x:k = scphasor(trig, rate/kr, 0, 1)
  sine:a = oscili(0.2, x*500+500)
  outch(1, sine)
endin
  
instr 2
  rate:k = linseg(1, p3, 40)
  trig:a = mpulse(1, 1/rate)
  x:a = scphasor(trig, rate/sr, 0, 1)
  sine:a = oscili(0.2, x*500 + 500)
  outch(2, sine)
endin

</CsInstruments>
<CsScore>
i1 0 20
i2 0 20
</CsScore>
</CsoundSynthesizer>
