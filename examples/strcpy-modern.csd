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
  ; Copy a literal, then copy that variable to two destinations.
  source:S = strcpy("Hello, world!")
  copied:S = strcpy(source)
  assigned:S = source

  ; Changing the source leaves both copies unchanged.
  source = strcpy("Goodbye.")
  prints("Source = %s\n", source)
  prints("Copy = %s\n", copied)
  prints("Assignment = %s\n", assigned)
endin
</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>
