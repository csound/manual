<CsoundSynthesizer>
<CsOptions>
-d
</CsOptions>
<CsInstruments>
// The Bela host supplies ksmps. Match sr to the board's audio rate.
sr = 44100
nchnls = 2
0dbfs = 1

instr CopyPin
  kInput init 0
  kInputPin init 0
  kInputMode init 0
  kOutputPin init 1
  kOutputMode init 1

  // Input mode replaces kInput with the pin reading.
  digiIOBela(kInput, kInputPin, kInputMode)
  kOutput = kInput
  kTime = timeinsts()
  if kTime >= p3 - 1 then
    kOutput = 0
  endif
  digiIOBela(kOutput, kOutputPin, kOutputMode)
endin
</CsInstruments>
<CsScore>
i "CopyPin" 0 10
e
</CsScore>
</CsoundSynthesizer>
