<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  ; Each argument gives the size of one dimension.
  iVector[] init 2
  iGrid[][] init 2, 3
  SNames[] init 2
  kControls[] init 3
  aSignals[] init 2

  prints "Vector length = %d\n", lenarray(iVector)
  prints "Grid dimensions = %d, sizes = %d x %d\n", \
         lenarray(iGrid, 0), lenarray(iGrid, 1), lenarray(iGrid, 2)
  prints "Initial grid value = %.0f\n", iGrid[1][2]
  prints "Initial string = '%s'\n", SNames[0]

  iGrid[1][2] = 7
  SNames[0] = "first"
  prints "Assigned grid value = %.0f, string = '%s'\n", iGrid[1][2], SNames[0]
endin
</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>
