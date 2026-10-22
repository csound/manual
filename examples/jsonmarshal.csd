<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  ; Negative GEN02 keeps these values without normalization.
  tableNumber:i = ftgen(0, 0, -8, -2, 0, 0.25, 0.5, 0.75, 1, 0.75, 0.5, 0.25)
  samples:i[] = init(ftlen(tableNumber))
  copyf2array(samples, tableNumber)
  compact:S = jsonmarshal(samples)
  indented:S = jsonmarshal(samples, 1)
  prints("Table as JSON: %s\n", compact)

  ; Mode 0 replaces any old file. Use a fixed format string for JSON text.
  handle:i = fiopen("jsonmarshal-table.json", 0)
  fprints(handle, "%s\n", indented)
  ficlose(handle)

  ; Read back after closing the output file, then restore another table.
  restored:i[] = jsonunmarshalfile("jsonmarshal-table.json")
  restoredTable:i = ftgen(0, 0, -lenarray(restored), -2, 0)
  copya2ftab(restored, restoredTable)
  prints("Restored %d values; table[4] = %.2f\n", \
         lenarray(restored), table(4, restoredTable))
endin
</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>
