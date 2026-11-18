<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

giHandle = dssiinit("/usr/lib/ladspa/amp.so", 0, 1)

instr 1
  // Loading the instance prints its ports. It remains inactive.
endin
</CsInstruments>
<CsScore>
i 1 0 1
e
</CsScore>
</CsoundSynthesizer>
