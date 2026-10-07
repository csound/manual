<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

// One channel holds two audio signals. Mode 3 allows input and output.
giShape[] fillarray 2
chnarray("voices", 3, "a", giShape)

instr 1
  aEnvelope = linen(0.15, 0.01, p3, 0.05)
  aLeft = oscili(aEnvelope, 330)
  aRight = oscili(aEnvelope, 440)
  aSignals[] = [aLeft, aRight]
  chnset(aSignals, "voices")
endin

instr 2
  // Instrument 2 reads after instrument 1 has written this cycle.
  aSignals[] = chnget("voices")
  outs(aSignals[0], aSignals[1])

  // Leave silence for the next cycle if no instrument writes new audio.
  chncleararray("voices")
endin
</CsInstruments>
<CsScore>
// Two short notes, with a gap between them.
i 1 0   0.8
i 1 1.4 0.8
// The reader stays active throughout, including the gap and final silence.
i 2 0   2.8
e
</CsScore>
</CsoundSynthesizer>
