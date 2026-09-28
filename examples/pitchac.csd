<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  aInput oscili 0.2, 200
  kPitch pitchac aInput, 100, 500, 50
  printks "Estimated pitch: %7.2f Hz\n", 0.1, kPitch
endin
</CsInstruments>
<CsScore>
i 1 0 1
e
</CsScore>
</CsoundSynthesizer>
