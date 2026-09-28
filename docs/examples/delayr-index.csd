<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1
  aEnv expon 0.2, p3, 0.00001
  aSource poscil aEnv, 220

  ; Keep both readers pending until all taps have initialized.
  aFullLeft, iLeft delayr 1
  aFullRight, iRight delayr 1
  ; Without the indices, both taps would select the second reader.
  aLeft deltapi 0.25, iLeft
  aRight deltapi 0.375, iRight

  ; Writers pair with readers in the order the readers appeared.
  delayw aSource + 0.5 * aLeft
  delayw aSource + 0.5 * aRight
  aFade linseg 1, p3 - 0.1, 1, 0.1, 0
  outs (aSource + aLeft) * aFade, (aSource + aRight) * aFade
endin
</CsInstruments>
<CsScore>
i 1 0 6
e
</CsScore>
</CsoundSynthesizer>
