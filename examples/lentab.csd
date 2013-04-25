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

   kS[] init 2
        printk2 lentab(kS)
endin

</CsInstruments>
<CsScore>
i 1 0 0
e
</CsScore>
</CsoundSynthesizer>
