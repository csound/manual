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
  kS[]    init 10
  kT[]    init 5
  kS      tabgen 0,10,0.01
  kT[]    tabslice kS,3,7
  printk2 kT[0]
  printk2 kT[1]
  printk2 kT[2]
  printk2 kT[3]
  printk2 kT[4]
endin

</CsInstruments>
<CsScore>
i 1 0 0
e
</CsScore>
</CsoundSynthesizer>
