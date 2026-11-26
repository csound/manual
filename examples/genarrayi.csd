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
  ;create and fill two arrays
  Arr1:k[] = genarrayi(1, 6)
  Arr2:k[] = genarrayi(1, 6, 2/3)

  ;print the content of kArr1
  printf("%s", 1, "kArr1: start=1, end=6, step=default\n")
  ndx:k = 0
  until ndx == lenarray(Arr1) do
    printf("Arr1[%d] = %f\n", ndx+1, ndx, Arr1[ndx])
    ndx += 1
  od

  ;print the content of kArr2
  printf("%s", 1, "Arr2: start=1, end=6, step=2/3\n")
  ndx = 0
  until ndx == lenarray(Arr2) do
    printf("Arr2[%d] = %f\n", ndx+1, ndx, Arr2[ndx])
    ndx += 1
  od

  turnoff()
endin

</CsInstruments>
<CsScore>
i 1 0 1
</CsScore>
</CsoundSynthesizer>
