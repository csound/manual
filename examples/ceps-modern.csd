<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

instr 1
  a1 = diskin("fox.wav", 1, 0, 1)
  k1 = randh(80, 2.5)
  a2 = vco2(1, 220+k1)
  kfsig[] = init(1026)
  fsig = pvsanal(a1, 1024, 256, 1024, 1)
  fsig2 = pvsanal(a2, 1024, 256, 1024, 1)
  kf = pvs2tab(kfsig, fsig)
  keps[] = ceps(c2r(kfsig), 30)
  kenv[] = cepsinv(keps)
  fenv = tab2pvs(r2c(kenv))
  out(pvsynth(pvsfilter(fsig2, fenv, 1)))
endin

</CsInstruments>
<CsScore>
i1 0 60
</CsScore>
</CsoundSynthesizer>