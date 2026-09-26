<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>

;browse for text files in current directory
instr 1
  Cnt:i = init(0)
  SFilenames[] = directory(".", ".wav")
  NumberOfFiles:i = lenarray(SFilenames)

  until Cnt >= NumberOfFiles do
    printfi("Filename = %s \n", 1, SFilenames[Cnt])
    Cnt += 1
  od
endin

</CsInstruments>
<CsScore>
i1 0 1
</CsScore>
</CsoundSynthesizer>