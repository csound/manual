<CsoundSynthesizer>
<CsOptions>
-n -m128
</CsOptions>
<CsInstruments>

instr 1
  ;create array and fill with numbers 1..10 resp .1..1
  Arr1:k[] = fillarray(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  Arr2:k[] = fillarray(1, 2, 3, 5, 8, 13, 21, 34, 55, 89)

  ;print contents
    printf("%s", 1, "\nArr1:\n")
  ndx:k = 0
  until ndx == lenarray(Arr1) do
    printf("Arr1[%d] = %f\n", ndx+1, ndx, Arr1[ndx])
    ndx += 1
  od
  printf("%s", 1, "\nArr2:\n")
  ndx = 0
  until ndx == lenarray(Arr2) do
    printf("Arr2[%d] = %f\n", ndx+1, ndx, Arr2[ndx])
    ndx += 1
  od

  ;add arrays
  Arr3:k[] = init(lenarray(Arr1))
  Arr3 = Arr1 + Arr2

  ;print content
  printf("%s", 1, "\nArr1 + Arr2:\n")
  ndx = 0
  until ndx == lenarray(Arr3) do
    printf("Arr3[%d] = %f\n", ndx+1, ndx, Arr3[ndx])
    ndx += 1
  od

  ;subtract arrays
  Arr4:k[] = init(lenarray(Arr1))
  Arr4 = Arr1 - Arr2

  ;print content
  printf("%s", 1, "\nArr1 - Arr2:\n")
  ndx = 0
  until ndx == lenarray(Arr4) do
    printf("Arr4[%d] = %f\n", ndx+1, ndx, Arr4[ndx])
    ndx += 1
  od

  ;multiply arrays
  Arr5:k[] = init(lenarray(Arr1))
  Arr5 = Arr1 * Arr2

  ;print content
  printf("%s", 1, "\nArr1 * Arr2:\n")
  ndx = 0
  until ndx == lenarray(Arr5) do
    printf("Arr5[%d] = %f\n", ndx+1, ndx, Arr5[ndx])
    ndx += 1
  od

  ;divide arrays
  Arr6:k[] = init(lenarray(Arr1))
  Arr6 = Arr1 / Arr2

  ;print content
  printf("%s", 1, "\nArr1 / Arr2:\n")
  ndx = 0
  until ndx == lenarray(Arr6) do
    printf("Arr5[%d] = %f\n", ndx+1, ndx, Arr6[ndx])
    ndx += 1
  od

  ;turnoff
  turnoff()
endin
  
</CsInstruments>
<CsScore>
i 1 0 0.1
</CsScore>
</CsoundSynthesizer>