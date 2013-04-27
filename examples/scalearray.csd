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
  kT[]    genarray   0,10
          scalearray kT,0,1
  printk2 kT[0]
  printk2 kT[1]
  printk2 kT[2]
  printk2 kT[3]
  printk2 kT[4]
  printk2 kT[5]
  printk2 kT[6]
  printk2 kT[7]
  printk2 kT[8]
  printk2 kT[9]
endin

</CsInstruments>
<CsScore>
i 1 0 0
e
</CsScore>
</CsoundSynthesizer>
