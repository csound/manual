<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-n
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
  kS[] init 1024
  printk2 kS[123]
  copy2ttab kS, 1
  printk2 kS[123]
endin

</CsInstruments>
<CsScore>
f1 0 1024 10 1
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>
