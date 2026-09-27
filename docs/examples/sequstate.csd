<CsoundSynthesizer>
<CsOptions>
-d -odac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1
  iRhythm[] = fillarray(0.5, 0.5, 0.5, 0.5)
  iInstruments[] = fillarray(2, 2, 2, 2)
  iNotes[] = fillarray(60, 64, 67, 72)
  kLength init 4

  // Mutate every four events and register the sequence as ID 3.
  kPosition = sequ(iRhythm, iInstruments, iNotes, 120, kLength, 4, 0, 0, 0, 3)
  iCount, iOrder[] = sequstate(3)
  kCount, kOrder[] = sequstate(3)

  prints "Initial counter %.0f, order %.0f %.0f %.0f %.0f\n", \
    iCount, iOrder[0], iOrder[1], iOrder[2], iOrder[3]

  if kPosition >= 0 then
    printks "Counter %.0f, order %.0f %.0f %.0f %.0f\n", 0, \
      kCount, kOrder[0], kOrder[1], kOrder[2], kOrder[3]
  endif
endin

instr 2
  aEnvelope = linseg(0, 0.01, 0.12, p3 - 0.02, 0.12, 0.01, 0)
  aTone = oscili(aEnvelope, cpsmidinn(p4))
  out(aTone, aTone)
endin
</CsInstruments>
<CsScore>
i 1 0 4
f 0 4.3
e
</CsScore>
</CsoundSynthesizer>
