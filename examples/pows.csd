<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr CompareTones
  iSize = 64
  kSamples[] init iSize

  // One cycle of the lower tone and two of the higher tone.
  // The lower tone has twice the amplitude.
  kIndex = 0
  while kIndex < iSize do
    kPhase = 2 * $M_PI * kIndex / iSize
    kSamples[kIndex] = 0.5 * cos(kPhase) + 0.25 * cos(2 * kPhase)
    kIndex += 1
  od

  // rfft returns packed real and imaginary coefficients.
  kSpectrum[] = rfft(kSamples)
  kPower[] = pows(kSpectrum)

  // Power bins are in frequency order, from DC to Nyquist.
  printks "750 Hz power = %.0f, 1500 Hz power = %.0f\n", 0, kPower[1], kPower[2]
  printks "Power ratio = %.0f\n", 0, kPower[1] / kPower[2]
  turnoff
endin
</CsInstruments>
<CsScore>
i "CompareTones" 0 0.1
e
</CsScore>
</CsoundSynthesizer>
