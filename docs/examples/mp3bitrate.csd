<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr ReportBitrate
  SFile = "beats.mp3"
  iBitrate = mp3bitrate(SFile)
  prints "%s reports %.0f kilobits per second\n", SFile, iBitrate
  prints "That is %.0f bits per second\n", iBitrate * 1000
endin
</CsInstruments>
<CsScore>
i "ReportBitrate" 0 0.01
e
</CsScore>
</CsoundSynthesizer>
