<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

// These opcodes are experimental. No oscillator or table reader uses
// these scratch tables. We inspect only their recorded lengths.
instr ResizeAtInit
  iTable = ftgen(0, 0, 16, -2, 1, 2, 3, 4)
  iBefore = ftlen(iTable)

  // The output is not assigned by the current implementation.
  iUnused = ftresizei(iTable, 8)
  iAfter = ftlen(iTable)
  prints("ftresizei requested 8. Recorded length changed from %d to %d.\n", iBefore, iAfter)
  ftfree(iTable, 1)
endin

instr ResizeAtPerf
  iTable = ftgen(0, 0, 16, -2, 1, 2, 3, 4)

  // Run once, on the first control cycle.
  if timeinstk() == 1 then
    kUnused = ftresize(iTable, 8)

    // ftlen is init-rate. A new note can read the changed length.
    event("i", "ReportLength", 0, 0.01, iTable)
  endif

  // Keep the table until ReportLength has finished.
  ftfree(iTable, 1)
endin

instr ReportLength
  iLength = ftlen(p4)
  prints("ftresize requested 8. Recorded length is %d.\n", iLength)
endin
</CsInstruments>
<CsScore>
i "ResizeAtInit" 0   0.1
i "ResizeAtPerf" 0.2 0.1
e
</CsScore>
</CsoundSynthesizer>
