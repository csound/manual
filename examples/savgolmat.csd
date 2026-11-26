<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

; savgolmat returns the Savitzky-Golay kernels as a 2-D array: one row per
; derivative, one column per sample of the window, oldest sample first.

instr 1
  kernels:i[][] = savgolmat(5, 2)

  ; row 0 smooths, row 1 gives the slope, row 2 the curvature.
  ; Each row is printed as integers over a common denominator.
  denom:i[] = fillarray(35, 10, 7)
  row:i = 0
  while row < lenarray(kernels, 1) do
    d:i = denom[row]
    prints("row %d: [%3d %3d %3d %3d %3d] / %d\n", row, \
           round(kernels[row][0] * d), round(kernels[row][1] * d), \
           round(kernels[row][2] * d), round(kernels[row][3] * d), \
           round(kernels[row][4] * d), d)
    row += 1
  od

  ; Applied by hand to five samples of y = x^2 taken at x = 1 .. 5, the
  ; kernels recover the parabola at the centre (x = 3) exactly:
  ; y = 9, y' = 2x = 6, y'' = 2.
  samples:i[] = fillarray(1, 4, 9, 16, 25)
  row = 0
  while row < 3 do
    acc:i = 0
    col:i = 0
    while col < 5 do
      acc += kernels[row][col] * samples[col]
      col += 1
    od
    prints("derivative %d at the centre: %g\n", row, acc)
    row += 1
  od
endin
</CsInstruments>
<CsScore>
i 1 0 0
e
</CsScore>
</CsoundSynthesizer>
