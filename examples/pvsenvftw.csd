<CsoundSynthesizer>
<CsOptions>
-d -odac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

; A 1024-point FFT needs exactly 512 envelope values.
giEnvelope = ftgen(0, 0, 512, 2, 0)

instr FollowBrightness
  aSource = vco2(0.12, 120)
  kCutoff = expon(400, p3, 4000)
  aFiltered = butterlp(aSource, kCutoff)
  fSpectrum = pvsanal(aFiltered, 1024, 256, 1024, 1)
  kUpdated = pvsenvftw(fSpectrum, giEnvelope, 1, 1, 80)

  ; Keep the latest readings between spectral frames.
  kLow init 0
  kHigh init 0
  if kUpdated == 1 then
    kLow = table(4, giEnvelope)
    kHigh = table(64, giEnvelope)
  endif
  printks "Envelope at 187.5 Hz %.6f, at 3000 Hz %.6f\n", 0.25, kLow, kHigh

  aEnvelope = linseg(0, 0.02, 1, p3 - 0.04, 1, 0.02, 0)
  out(aFiltered * aEnvelope)
endin
</CsInstruments>
<CsScore>
i "FollowBrightness" 0 4
e
</CsScore>
</CsoundSynthesizer>
