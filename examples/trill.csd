<CsoundSynthesizer>
<CsOptions>
-d
</CsOptions>
<CsInstruments>
// The Bela host supplies ksmps. Match sr to the board's audio rate.
sr = 44100
nchnls = 2
0dbfs = 1

instr 1
  // Trill Bar can report up to five touches.
  iCapacity = 5
  kSizes[] init iCapacity
  kVertical[] init iCapacity
  kHorizontal[] init iCapacity
  kCount, kSizes, kVertical, kHorizontal = trill(iCapacity, 0)

  kFrequency init 220
  kLevel = 0
  if kCount > 0 then
    kFrequency = 220 + 660 * kVertical[0]
    kLevel = 0.1
  endif
  kSmoothFrequency = portk(kFrequency, 0.02, 220)
  kSmoothLevel = portk(kLevel, 0.02)
  aTone = oscili(kSmoothLevel, kSmoothFrequency)
  out(aTone, aTone)
endin
</CsInstruments>
<CsScore>
i 1 0 60
e
</CsScore>
</CsoundSynthesizer>
