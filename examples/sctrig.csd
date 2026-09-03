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
  m:k = metro(1)
  t:k = timeinsts()
  trig:k = sctrig(m, 0.5)
  printks("t=%f  km=%f    ktrig=%f\n", 0.01, t, m, trig)
endin

instr 2
  m:a = upsamp(metro(1))
  env:a = sctrig(m, 0.5)
  sig:a = pinker()
  outch(1, sig*env)
  outch(2, sig)
endin

</CsInstruments>
<CsScore>
i 1 0 10
i 2 0 10

</CsScore>
</CsoundSynthesizer>
