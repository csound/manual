<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  ; oscili is an OpcodeDef. oscillator has its own phase state.
  oscillator:Opcode = create(oscili)
  aTone = run(oscillator, 0.1, 440)
  aEnvelope linseg 0, 0.01, 1, p3 - 0.02, 1, 0.01, 0
  out aTone * aEnvelope
  delete(oscillator)
endin

instr 2
  ; Three objects keep three separate oscillator phases.
  kFrequencies[] fillarray 440, 550, 660
  oscillators:Opcode[] = create(oscili, lenarray(kFrequencies))
  aTones[] = run(oscillators, 0.03, kFrequencies)
  aEnvelope linseg 0, 0.01, 1, p3 - 0.02, 1, 0.01, 0
  out (aTones[0] + aTones[1] + aTones[2]) * aEnvelope
  delete(oscillators)
endin
</CsInstruments>
<CsScore>
i 1 0 1
i 2 1.2 1
e
</CsScore>
</CsoundSynthesizer>
