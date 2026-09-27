<CsoundSynthesizer>
<CsOptions>
-d
</CsOptions>
<CsInstruments>
// The Bela host supplies ksmps. Match sr to the board's audio rate.
sr = 44100
nchnls = 2
0dbfs = 1

instr SendPulse
  kPhase = phasor(1)
  kState = (kPhase < 0.5 ? 1 : 0)
  kTime = timeinsts()
  if kTime >= p3 - 1 then
    kState = 0
  endif
  digiOutBela(kState, 1)
endin
</CsInstruments>
<CsScore>
i "SendPulse" 0 10
e
</CsScore>
</CsoundSynthesizer>
