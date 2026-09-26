<CsoundSynthesizer>
<CsOptions>
-d -odac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

instr SpectralTexture
  aSource = vco2(0.15, 220)
  fSource = pvsanal(aSource, 1024, 256, 1024, 1)

  // Keep the first two seconds steady, then add frequency changes.
  kSpread = linseg(0, 2, 0, 2, 3000, 2, 3000)

  // Ordinary analysis ignores the amplitude control, so leave it at 0.
  fTexture = pvsgendy(fSource, 0, kSpread)
  aOriginal = pvsynth(fSource)
  aTexture = pvsynth(fTexture)

  // Fade both channels after resynthesis to avoid clicks at note edges.
  aFade = linseg(0, 0.1, 1, p3 - 0.2, 1, 0.1, 0)
  outs(aOriginal * aFade, aTexture * aFade)
endin
</CsInstruments>
<CsScore>
i "SpectralTexture" 0 6
e
</CsScore>
</CsoundSynthesizer>
