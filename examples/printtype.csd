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
  iOffset = 2
  kValue init 3
  aSignal init 0
  Sname = "flute"
  iNotes[] fillarray 60, 64, 67

  ; Each call prints the type once, when this note starts.
  printtype(iOffset)
  printtype(kValue)
  printtype(aSignal)
  printtype(Sname)
  printtype(iNotes)

  ; The expression has k-rate because one of its inputs is k-rate.
  printtype(iOffset + kValue)
endin
</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>
