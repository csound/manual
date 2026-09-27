<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr ReportChannels
  SFile = "beats.mp3"
  iChannels = mp3nchnls(SFile)
  prints "%s has %.0f encoded channels\n", SFile, iChannels
  if iChannels == 1 then
    prints "The file is mono\n"
  else
    prints "The file is stereo\n"
  endif
  prints "Csound has %.0f output channels\n", nchnls
endin
</CsInstruments>
<CsScore>
i "ReportChannels" 0 0.01
e
</CsScore>
</CsoundSynthesizer>
