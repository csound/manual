<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr ReportSampleRate
  SFile = "beats.mp3"
  iFileRate = mp3sr(SFile)
  prints "%s has a sample rate of %.0f Hz\n", SFile, iFileRate
  prints "Csound runs at %.0f Hz\n", sr
  if iFileRate == sr then
    prints "The sample rates match\n"
  else
    prints "The file and orchestra use different sample rates\n"
  endif
endin
</CsInstruments>
<CsScore>
i "ReportSampleRate" 0 0.01
e
</CsScore>
</CsoundSynthesizer>
