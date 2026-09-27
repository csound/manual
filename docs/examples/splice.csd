<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1
    inst@global:Instr = this
    printk2 1
endin

instr 2
   err:i = splice(inst,this,1)
   printk2 2
endin

;schedule(10,0,1)
</CsInstruments>
<CsScore>
f0 3
i1 0 1
i2 0 1
</CsScore>
</CsoundSynthesizer>
