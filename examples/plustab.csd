<CsoundSynthesizer>

<CsInstruments>

instr 1
  t1 init 10
  t2 init 10
  t2[3] = 42
  t3 init 10, -4.2
  t1 plustab t2, t3
  k1 maxtab t1
  printk2 k1
endin
</CsInstruments>

<CsScore>
i1 0 0.1
e
</CsScore>

</CsoundSynthesizer>
