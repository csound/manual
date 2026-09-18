<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
instr 1
  A1:k[] = fillarray(0, 1, 2, 3, 4, 5, 6, 7) ; <-- 8 elements
  printf("lenarray(A1) before slicearray: %d\n", 1, lenarray(A1))
  A2:k[] = slicearray(A1, 1, 4) ; <-- 4 elements
  printf("lenarray(A2) AFTER  slicearray: %d\n", 1, lenarray(A2))
  trim(A1, 4)
  printks("A1 after trim: { ", 0)
  Cnt:k = 0
  while (Cnt < lenarray:k(A1)) do
    printf("%d ", Cnt + 1, A1[Cnt])
    Cnt += 1
  od
  printks("}\n", 0)
  turnoff()
endin
</CsInstruments>

<CsScore>
i1  0 0.1
e
</CsScore>

</CsoundSynthesizer>