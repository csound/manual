<CsoundSynthesizer>
<CsOptions>
-d -o dac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

giSine ftgen 0, 0, 1024, 10, 1
giHarmonics ftgen 0, 0, 2048, 10, 1, 0.5, 0.25

instr ChangeWaveform
  // Switch tables halfway through the four-second note.
  kTime = timeinsts()
  if kTime < 2 then
    kTable = giSine
  else
    kTable = giHarmonics
  endif

  // The same normalized phase works with both table lengths.
  aPhase = phasor(220)
  aWave = table3kt(aPhase, kTable, 1, 0, 1)

  // Fade out at two seconds, then fade in with the new waveform.
  aEnvelope = linseg(0, 0.05, 0.2, 1.9, 0.2, 0.05, 0, \
                    0.05, 0.2, 1.9, 0.2, 0.05, 0)
  out(aWave * aEnvelope)
endin
</CsInstruments>
<CsScore>
i "ChangeWaveform" 0 4
e
</CsScore>
</CsoundSynthesizer>
