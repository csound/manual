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
  kS[] init 10
  kT[] init 10
  kS   tabgen 0,10,0.01
  kT   tabmap kS,"sin"
  printk2 kS[0]
  printk2 kS[4]
  printk2 kS[9]
  printk2 kT[0]
  printk2 kT[4]
  printk2 kT[9]
endin

</CsInstruments>
<CsScore>
i 1 0 0
e
</CsScore>
</CsoundSynthesizer>
