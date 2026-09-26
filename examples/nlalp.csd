<CsoundSynthesizer>
<CsOptions>
-d -odac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr CompareFilter
  aInput = oscili(0.15, 1000)
  kLinear = -0.2
  kNonlinear = p4

  ; The sum of the coefficient magnitudes stays below 1.
  aFiltered = nlalp(aInput, kLinear, kNonlinear)
  aEnvelope = linseg(0, 0.02, 1, p3 - 0.04, 1, 0.02, 0)
  out(aFiltered * aEnvelope)
endin
</CsInstruments>
<CsScore>
; First hear the linear case, then the added nonlinear term.
i "CompareFilter" 0   2 0
i "CompareFilter" 2.5 2 0.6
e
</CsScore>
</CsoundSynthesizer>
