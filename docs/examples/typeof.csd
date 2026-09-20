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
  kFrequency init 440
  iNotes[] fillarray 60, 64, 67

  ; Save the type name so we can print it and compare it.
  SfrequencyType = typeof(kFrequency)
  printf_i "Frequency control has type %s\n", 1, SfrequencyType
  if strcmp(SfrequencyType, "k") == 0 then
    prints "The frequency control can change during a note\n"
  endif

  ; An array and an element of that array have different types.
  printf_i "Note array has type %s\n", 1, typeof(iNotes)
  printf_i "First note has type %s\n", 1, typeof(iNotes[0])

  ; A numeric literal has the constant type.
  printf_i "Literal 440 has type %s\n", 1, typeof(440)
endin
</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>
