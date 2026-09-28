<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  iMidiNote = p4
  iFrequency = cpsmidinn(iMidiNote)
  iOctaveFrequency = cpsmidinn(iMidiNote + 12)
  iAmplitude = 0.1

  ; These checks only count when --run-unit-tests is enabled.
  assert(iFrequency > 0)
  ; Allow a small rounding difference in the pitch calculation.
  assert_true(abs(iOctaveFrequency - 2 * iFrequency) < 0.000001)
  assert_false(iAmplitude < 0 || iAmplitude > 1)

  aEnvelope linseg 0, 0.01, iAmplitude, p3 - 0.02, iAmplitude, 0.01, 0
  aTone poscil aEnvelope, iFrequency
  out aTone
endin
</CsInstruments>
<CsScore>
i 1 0 1 60
i 1 1.2 1 69
e
</CsScore>
</CsoundSynthesizer>
