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
  Sfiles[] argv
  iFileCount = lenarray(Sfiles)

  ; Check the count before reading any array elements.
  if iFileCount == 0 then
    prints "Run csound argv.csd -- file.wav [more files]\n"
  else
    ; Each argument is one path, including paths quoted to keep spaces.
    iIndex = 0
    while iIndex < iFileCount do
      iSeconds filelen Sfiles[iIndex]
      prints "%s lasts %.3f seconds\n", Sfiles[iIndex], iSeconds
      iIndex += 1
    od
  endif
endin
</CsInstruments>
<CsScore>
i 1 0 0.01
e
</CsScore>
</CsoundSynthesizer>
