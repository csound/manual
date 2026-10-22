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

;an 'empty' function table with 10 points
Table@global:i = ftgen(0, 0, -10, 2, 0)


instr 1
  ;print inital values of Table
  puts("\nInitial table content:", 1)
  indx = 0
  until indx == ftlen(Table) do
    iVal = table(indx, Table)
    printf_i("Table index %d = %f\n", 1, indx, iVal)
    indx += 1
  od

  ;create array
  Arr:k[] = init(10)

  ;fill in values
  Arr = genarray(1, 10)

  ;print array values
  printf("%s", 1, "\nArray content:\n")
  ndx:k = 0
  until ndx == lenarray(Arr) do
    printf("Arr[%d] = %f\n", ndx+1, ndx, Arr[ndx])
    ndx += 1
  od

  ;copy array values to table
  copya2ftab(Arr, Table)

  ;print modified values of Table
  printf("%s", 1, "\nModified table content after copya2ftab:\n")
  ndx = 0
  until ndx == ftlen(Table) do
    Val:k = table(ndx, Table)
    printf("Table index %d = %f\n", ndx+1, ndx, Val)
    ndx += 1
  od

  ;turn instrument off
  turnoff()
endin
  
</CsInstruments>
<CsScore>
i 1 0 0.1
</CsScore>
</CsoundSynthesizer>