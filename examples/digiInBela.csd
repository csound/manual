<CsoundSynthesizer>
<CsOptions>
-d
</CsOptions>
<CsInstruments>
// The Bela host supplies ksmps. Match sr to the board's audio rate.
sr = 44100
nchnls = 2
0dbfs = 1

instr GateTone
  kHigh = digiInBela(0)
  kLevel = portk(kHigh * 0.1, 0.01)
  aTone = oscili(kLevel, 440)
  out(aTone, aTone)
endin
</CsInstruments>
<CsScore>
i "GateTone" 0 10
e
</CsScore>
</CsoundSynthesizer>
