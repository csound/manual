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
  Ssource strcpy "Hello, world!"
  Scopy strcpy Ssource
  Sassigned = Ssource

  ; Changing the source leaves both copies unchanged.
  Ssource strcpy "Goodbye."
  prints "Source = %s\n", Ssource
  prints "Copy = %s\n", Scopy
  prints "Assignment = %s\n", Sassigned
endin
</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>
