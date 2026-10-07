<CsoundSynthesizer>
<CsOptions>
-d -odac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

instr Quadrature
  iPolar = p4
  kFrequency = linseg(220, p3, 440)
  signal:Complex[] = quadosc(kFrequency, iPolar)

  // Extract audio from the block of complex samples.
  aCos = real(signal)
  aSin = imag(signal)
  aLevel = linseg(0, 0.05, 0.15, p3 - 0.1, 0.15, 0.05, 0)
  out(aCos * aLevel, aSin * aLevel)
endin
</CsInstruments>
<CsScore>
// Rectangular storage, then polar storage.
i "Quadrature" 0 3 0
i "Quadrature" 3.5 3 1
e
</CsScore>
</CsoundSynthesizer>
