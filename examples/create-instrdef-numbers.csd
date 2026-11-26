<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  definition:InstrDef = create({{ prints "First definition\\n" }})
  original:InstrDef = definition
  iFirst = nstrnum(definition)

  ; Reusing the variable does not replace the first definition.
  definition = create({{ prints "Second definition\\n" }})
  iSecond = nstrnum(definition)
  iOriginal = nstrnum(original)

  printfi("First number: %d\n", 1, iFirst)
  printfi("Second number: %d\n", 1, iSecond)
  printfi("Saved reference: %d\n", 1, iOriginal)

  schedule(original, 0, 0.1)
  schedule(definition, 0, 0.1)

  ; Both notes finish before instrument 1 ends.
  delete(original)
  delete(definition)
endin

schedule(1, 0, 0.5)
</CsInstruments>
<CsScore>
f 0 0.5
</CsScore>
</CsoundSynthesizer>
