<CsoundSynthesizer>
<CsOptions>
-d -odac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

instr AddHarmonic
  ; A quarter-cycle starting phase turns the built-in sine into a cosine.
  aInput = oscili(1, 220, -1, 0.25)
  kThird = line(0, p3, 0.5)

  ; The four weights are DC, fundamental, second and third harmonic.
  aList = chebyshevpoly2(aInput, 0, 1, 0, kThird)

  kWeights[] fillarray 0, 1, 0, 0
  kWeights[3] = kThird
  aArray = chebyshevpoly2(aInput, kWeights)

  ; Shape the output volume without changing the input amplitude.
  aEnvelope = linseg(0, 0.02, 1, p3 - 0.04, 1, 0.02, 0)
  outs(0.25 * aList * aEnvelope, 0.25 * aArray * aEnvelope)
endin
</CsInstruments>
<CsScore>
i "AddHarmonic" 0 4
e
</CsScore>
</CsoundSynthesizer>
