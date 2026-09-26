<CsoundSynthesizer>
<CsOptions>
-d -odac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr ReadFormants
  ; Create lpform-poles.lpc with lpanal -a before running this example.
  lpslot 0
  kTime = timeinsts()
  kResidual, kOriginal, kError, kPitch = lpread(kTime, "lpform-poles.lpc")

  ; Read two pole pairs from the analysis above.
  kFrequency1, kBandwidth1 = lpform(1)
  kFrequency2, kBandwidth2 = lpform(2)
  printks "Pair 1 %.0f Hz, bandwidth %.0f Hz | Pair 2 %.0f Hz, bandwidth %.0f Hz\n", 0.1, kFrequency1, kBandwidth1, kFrequency2, kBandwidth2

  ; Listen to the source while watching the estimates.
  aVoice = diskin2("fox.wav", 1)
  out(aVoice * 0.5)
endin
</CsInstruments>
<CsScore>
i "ReadFormants" 0 2.5
e
</CsScore>
</CsoundSynthesizer>
