<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 4800  // Ten control cycles per second.
nchnls = 1
0dbfs = 1

instr 1
  // Both decays last four control cycles.
  kLinen = linen(1, 0, 0.4, 0.4)
  kLinseg = linseg(1, 0.4, 0)
  kStep init 0
  printks "step %d  linen %.6f  linseg %.6f\n", 0, kStep, kLinen, kLinseg
  kStep += 1
endin
</CsInstruments>
<CsScore>
// Continue past the endpoint to show what happens afterward.
i 1 0 0.7
e
</CsScore>
</CsoundSynthesizer>
