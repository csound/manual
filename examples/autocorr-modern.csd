<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>

0dbfs = 1

instr 1
  kin[] = fillarray(1,0,1,0,1,0,1)
  kout[] = autocorr(kin)
  cnt:k = init(0)
  while cnt < lenarray(kout) do
    printk2(kout[cnt])
    cnt += 1
  od
  turnoff
endin

</CsInstruments>
<CsScore>
i1 0 1
</CsScore>
</CsoundSynthesizer>