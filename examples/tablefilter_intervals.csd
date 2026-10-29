<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

// Onset times in seconds for four evenly spaced notes.
giOnsets ftgen 0, 0, -4, -2, .25, .5, .75, 1

instr 1
  // Copy the onsets, then replace the copy with intervals at initialization.
  iIntervals ftgen 0, 0, -4, -2, 0
  tableicopy iIntervals, giOnsets
  iCount tablefilteri iIntervals, iIntervals, 3, 1

  iIndex = 0
  while iIndex < iCount do
    iInterval table iIndex, iIntervals
    prints "init interval %d = %.2f seconds\n", iIndex + 1, iInterval
    iIndex += 1
  od

  // Keep the source unchanged when filtering on every control cycle.
  iOutput ftgen 0, 0, -4, -2, 0
  kCount tablefilter iOutput, giOnsets, 3, 1
  if timeinstk() == 1 then
    kIndex = 0
    while kIndex < kCount do
      kInterval table kIndex, iOutput
      printf "perf interval %d = %.2f seconds\n", kIndex + 1, kIndex + 1, kInterval
      kIndex += 1
    od
  endif
endin
</CsInstruments>
<CsScore>
i 1 0 .01
e
</CsScore>
</CsoundSynthesizer>
