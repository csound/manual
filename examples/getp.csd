<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

opcode PitchPair, kk, k
  kRoot xin
  // Output 0 is the root. Output 1 is a perfect fifth above it.
  xout kRoot, kRoot * 1.5
endop

instr ChoosePitch
  pitches:Opcode = create(PitchPair)
  kRoot, kFifth = run(pitches, 220)

  // Alternate between output 0 and output 1 each second.
  kIndex = int(timeinsts()) % 2
  kSelected = getp(pitches, kIndex)

  // Smooth pitch changes and fade the note in and out.
  kFrequency = portk(kSelected, 0.01, 220)
  aEnvelope = linen(0.15, 0.01, p3, 0.1)
  aTone = oscili(aEnvelope, kFrequency)
  out(aTone)

  // Keep the object until this instrument ends.
  delete(pitches)
endin
</CsInstruments>
<CsScore>
i "ChoosePitch" 0 4
e
</CsScore>
</CsoundSynthesizer>
