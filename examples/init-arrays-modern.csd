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
  vector:i[] = init(2)
  grid:i[] = init(2, 3)
  names:S[] = init(2)
  controls:k[] = init(3)
  signals:a[] = init(2)

  prints("Vector length = %d\n", lenarray(vector))
  prints("Grid dimensions = %d, sizes = %d x %d\n", \
         lenarray(grid, 0), lenarray(grid, 1), lenarray(grid, 2))
  prints("Initial grid value = %.0f\n", grid[1][2])
  prints("Initial string = '%s'\n", names[0])

  grid[1][2] = 7
  names[0] = "first"
  prints("Assigned grid value = %.0f, string = '%s'\n", grid[1][2], names[0])
endin
</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>
