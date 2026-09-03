<CsoundSynthesizer>
<CsOptions>
-nm128
</CsOptions>
<CsInstruments>

opcode FirstEl, k, k[]
  ;returns the first element of vector kArr
  Arr:k[] = xin()
  xout(Arr[0])
endop

instr 1 
  Arr:k[] = fillarray(6, 3, 9, 5, 1)
  first:k = FirstEl(Arr)
  printf("first = %d\n", 1, first)
  turnoff()
endin

</CsInstruments>
<CsScore>
i 1 0 0.1
</CsScore>
</CsoundSynthesizer>