<CsoundSynthesizer>

<CsInstruments>

instr 1
  t1 init 10
  t1[3] = 42
  k1 sumtab t1
  printk2 k1
endin
</CsInstruments>

<CsScore>
i1 0 0.1
e
</CsScore>

</CsoundSynthesizer>
