<CsoundSynthesizer>
<CsOptions>
-d -o dac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

// Fill the scale before any instrument starts.
gkScale[] fillarray 60, 62, 64, 65, 67, 69, 71

instr Chord
  // Include indices 0, 2 and 4. The end index is inclusive.
  kNotes[] = slicearrayi(gkScale, 0, 4, 2)
  SNames[] fillarray "C", "D", "E", "F", "G", "A", "B"
  SChord[] = slicearrayi(SNames, 0, 4, 2)
  prints "%s %s %s\n", SChord[0], SChord[1], SChord[2]

  // These notes keep the scale values copied when the instrument started.
  kRoot = cpsmidinn(kNotes[0])
  kThird = cpsmidinn(kNotes[1])
  kFifth = cpsmidinn(kNotes[2])
  aRoot = oscili(0.15, kRoot)
  aThird = oscili(0.15, kThird)
  aFifth = oscili(0.15, kFifth)
  aEnvelope = linen(1, 0.02, p3, 0.1)
  out((aRoot + aThird + aFifth) * aEnvelope)
endin
</CsInstruments>
<CsScore>
i "Chord" 0 2
e
</CsScore>
</CsoundSynthesizer>
