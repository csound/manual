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
  ; Phase .75 starts after the .65 offbeat, so that offbeat is skipped.
  kTrigger metro2 4, .65, -1, .75
  kTime timeinsts
  if kTrigger != 0 then
    printks "Time: %.4f s, trigger: %+.0f\n", 0, kTime, kTrigger
  endif
endin
</CsInstruments>
<CsScore>
i 1 0 2
e
</CsScore>
</CsoundSynthesizer>
