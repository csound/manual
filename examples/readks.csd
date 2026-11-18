<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr ReadCues
  SLine = readks("readks.txt", 0.5)
  kStop = strindexk(SLine, "END")
  if kStop == 0 then
    turnoff
  else
    // Print once per read, keeping the newline supplied by the file.
    kPrint = metro(2)
    printf("%s", kPrint, SLine)
  endif
endin
</CsInstruments>
<CsScore>
i "ReadCues" 0 3
e
</CsScore>
</CsoundSynthesizer>
