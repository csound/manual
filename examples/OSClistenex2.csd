<CsoundSynthesizer>
<CsOptions>
-odac --port=7000
</CsOptions>
<CsInstruments>

0dbfs = 1

instr 1
 freq:k chnget "freq"
 amp:k  chnget "amp"
    out oscili(0dbfs*amp, p4*freq)
 status:k, f:k, mess:S, n:k OSClisten "/in", "fsi"
 puts mess, status
 printk2 n
 printk2 f
 status, nums:k[] OSClisten "/ina", "fi"
 printk2 nums[0]
 printk2 nums[1] 
endin

instr 2
 OSCsend 0, "localhost", 7000, "/csound/event/instr", "ffff", 1, 0, 1, 300
 OSCsend 1, "localhost", 7000, "/csound/channel/freq/amp", "ff", p4, p5
 OSCsend 2, "localhost", 7000, "/in", "fsi", p5, "hello", p4
 OSCsend 3, "localhost", 7000, "/ina", "fi", p5, p4
 OSCsend 4, "localhost", 7000, "/csound/event", "s", "i3 4 1"
 OSCsend 5, "localhost", 7000, "/csound/compile", "s", "schedule 1,2,2,500"
endin

instr 3
 OSCsend 0, "localhost", 7000, "/csound/stop"
endin

</CsInstruments>
<CsScore>
i2 0 2 1 0.2
</CsScore>
</CsoundSynthesizer>








