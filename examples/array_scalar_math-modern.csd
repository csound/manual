<CsoundSynthesizer>
<CsOptions>
-n -m128
</CsOptions>
<CsInstruments>

instr 1
  ;create array and fill with numbers 1..10
  Arr1:k[] = fillarray(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

  ;print content
  printf("%s", 1, "\nInitial content:\n")
  ndx:k = 0
  until ndx == lenarray(Arr1) do
    printf("Arr[%d] = %f\n", ndx+1, ndx, Arr1[ndx])
    ndx += 1
  od

  ;add 10
  Arr2:k[] = init(lenarray(Arr1))
  Arr2 = Arr1 + 10

  ;print content
  printf("%s", 1, "\nAfter adding 10:\n")
  ndx = 0
  until ndx == lenarray(Arr2) do
    printf("Arr[%d] = %f\n", ndx+1, ndx, Arr2[ndx])
    ndx += 1
  od

  ;subtract 5
  Arr3:k[] = init(lenarray(Arr1))
  Arr3 = Arr2 - 5

  ;print content
  printf("%s", 1, "\nAfter subtracting 5:\n")
  ndx = 0
  until ndx == lenarray(Arr3) do
    printf("Arr[%d] = %f\n", ndx+1, ndx, Arr3[ndx])
    ndx += 1
  od

  ;multiply by -1.5
  Arr4:k[] = init(lenarray(Arr1))
  Arr4 = Arr3 * -1.5

  ;print content
  printf("%s", 1, "\nAfter multiplying by -1.5:\n")
  ndx = 0
  until ndx == lenarray(Arr4) do
    printf("Arr[%d] = %f\n", ndx+1, ndx, Arr4[ndx])
    ndx += 1
  od

  ;divide by -3/2
  Arr5:k[] = init(lenarray(Arr1))
  Arr5 = Arr4 / -(3/2)

  ;print content
  printf("%s", 1, "\nAfter dividing by -3/2:\n")
  ndx = 0
  until ndx == lenarray(Arr5) do
    printf("Arr[%d] = %f\n", ndx+1, ndx, Arr5[ndx])
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