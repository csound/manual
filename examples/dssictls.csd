<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

giHandle = dssiinit("/usr/lib/ladspa/amp.so", 0, 1)

instr 1
  kGain = linseg(0, 4, 1, 2, 1)
  dssictls(giHandle, 0, kGain, 1)
  dssiactivate(giHandle, 1)
  aInput = oscili(0.1, 440)
  aOutput = dssiaudio(giHandle, aInput)
  out(aOutput, aOutput)
endin
</CsInstruments>
<CsScore>
i 1 0 6
e
</CsScore>
</CsoundSynthesizer>
