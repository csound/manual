<CsoundSynthesizer>
<CsOptions>
-d -odac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

instr CompareReverbs
  iVersion = p4
  iModulation = p5

  // A short, bright burst leaves most of the note for the reverb tail.
  aEnvelope = linseg(0, 0.002, 1, 0.04, 0, p3 - 0.042, 0)
  aSource = vco2(0.2, 330) * aEnvelope

  if iVersion == 1 then
    aLeft, aRight = reverbsc(aSource, aSource, 0.88, 10000, sr, iModulation)
  else
    aLeft, aRight = reverbsc2(aSource, aSource, 0.88, 10000, sr, iModulation)
  endif

  // Fade the end of the tail before the instrument stops.
  aFade = linseg(1, p3 - 0.1, 1, 0.1, 0)
  out(0.2 * aSource + aLeft * aFade, 0.2 * aSource + aRight * aFade)
endin
</CsInstruments>
<CsScore>
// reverbsc, then reverbsc2, with delay modulation.
i "CompareReverbs" 0 5 1 1
i "CompareReverbs" 5.5 5 2 1
// Repeat with fixed delays.
i "CompareReverbs" 11 5 1 0
i "CompareReverbs" 16.5 5 2 0
e
</CsScore>
</CsoundSynthesizer>
