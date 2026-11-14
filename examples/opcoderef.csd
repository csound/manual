<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr NamedOscillator
  // The score chooses which oscillator this note uses.
  SName = strget(p4)
  definition:OpcodeDef = opcoderef(SName)
  oscillator:Opcode = create(definition)

  // Overload 0 of both choices accepts amplitude and frequency.
  aTone = run(oscillator, 0.15, 220)
  aEnvelope = linen(1, 0.01, p3, 0.05)
  out(aTone * aEnvelope)

  // Release this note's oscillator when the instrument ends.
  delete(oscillator)
endin
</CsInstruments>
<CsScore>
// A sine wave, followed by a sawtooth at the same pitch.
i "NamedOscillator" 0   1.5 "oscili"
i "NamedOscillator" 1.8 1.5 "vco2"
e
</CsScore>
</CsoundSynthesizer>
