<CsoundSynthesizer>
<CsOptions>
-d -odac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr CompareClocks
  iStart = systime()
  kNow = systime()
  kMilliseconds = kNow - iStart
  kPerformance = elapsedtime()
  printks "Real time %.0f ms, performance time %.3f seconds\n", 0.25, \
    kMilliseconds, kPerformance

  // Silent audio paces the performance in real time.
  aSilence = 0
  out(aSilence)
endin
</CsInstruments>
<CsScore>
i "CompareClocks" 0 2
e
</CsScore>
</CsoundSynthesizer>
