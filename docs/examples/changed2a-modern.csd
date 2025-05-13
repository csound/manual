<CsoundSynthesizer>

<CsOptions>
-n
</CsOptions>
<CsInstruments>
Array@global:k[][] = init(2, 3)
Array = fillarray(1, 2, 3, 7, 6, 5)

instr 1
  k1 = changed2(Array)
  if k1 == 1 then
    printks("An element in the array changed", 0)
  endif
endin

instr 2; change value of channel 'step1'
  Array[1][0] = 3
endin

</CsInstruments>
<CsScore>
i1 0 100
i2 4 0.1
</CsScore>

</CsoundSynthesizer>