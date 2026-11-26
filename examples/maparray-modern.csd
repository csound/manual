<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-n
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
  ;create an array and fill with numbers
  ArrSrc:k[] = fillarray(1.01, 2.02, 3.03, 4.05, 5.08, 6.13, 7.21)

  ;print source array
  printf("%s", 1, "\nSource array:\n")
  ndx:k = 0
  until ndx == lenarray(ArrSrc) do
    printf("ArrSrc[%d] = %f\n", ndx+1, ndx, ArrSrc[ndx])
    ndx += 1
  od

  ;create an empty array for the results
  ArrRes:k[] = init(7)

  ;apply the sqrt() function to each element
  ArrRes = maparray(ArrSrc, "sqrt")

  ;print the result
  printf("%s", 1, "\nResult after applying sqrt() to source array\n")
  ndx = 0
  until ndx == lenarray(ArrRes) do
    printf("ArrRes[%d] = %f\n", ndx+1, ndx, ArrRes[ndx])
    ndx += 1
  od

  ;apply the log() function to each element
  ArrRes = maparray(ArrSrc, "log")

  ;print the result
  printf("%s", 1, "\nResult after applying log() to source array\n")
  ndx = 0
  until ndx == lenarray(ArrRes) do
    printf("ArrRes[%d] = %f\n", ndx+1, ndx, ArrRes[ndx])
    ndx += 1
  od

  ;apply the int() function to each element
  ArrRes = maparray(ArrSrc, "int")

  ;print the result
  printf("%s", 1, "\nResult after applying int() to source array\n")
  ndx = 0
  until ndx == lenarray(ArrRes) do
    printf("ArrRes[%d] = %f\n", ndx+1, ndx, ArrRes[ndx])
    ndx += 1
  od

  ;apply the frac() function to each element
  ArrRes = maparray(ArrSrc, "frac")

  ;print the result
  printf("%s", 1, "\nResult after applying frac() to source array\n")
  ndx = 0
  until ndx == lenarray(ArrRes) do
    printf("ArrRes[%d] = %f\n", ndx+1, ndx, ArrRes[ndx])
  ndx += 1
  od

  ;turn instrument instance off
  turnoff()
endin

</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>