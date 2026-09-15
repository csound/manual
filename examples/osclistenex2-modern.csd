<CsoundSynthesizer>
<CsOptions>
-odac --port=7000
</CsOptions>
<CsInstruments>

0dbfs = 1

instr 1
  freq:k = chnget("freq")
  amp:k = chnget("amp")
  out(oscili(0dbfs*amp, p4*freq))
  status:k, f:k, mess:S, n:k = osclisten("/in", "fsi")
  puts(mess, status)
  printk2(n)
  printk2(f)
  status, nums:k[] = osclisten("/ina", "fi")
  printk2(nums[0])
  printk2(nums[1])
endin

instr 2
  oscsend(0, "localhost", 7000, "/csound/event/instr", "ffff", 1, 0, 1, 300)
  oscsend(1, "localhost", 7000, "/csound/channel/freq/amp", "ff", p4, p5)
  oscsend(2, "localhost", 7000, "/in", "fsi", p5, "hello", p4)
  oscsend(3, "localhost", 7000, "/ina", "fi", p5, p4)
  oscsend(4, "localhost", 7000, "/csound/event", "s", "i3 4 1")
  oscsend(5, "localhost", 7000, "/csound/compile", "s", "schedule 1, 2, 2, 500")
endin

instr 3
  oscsend(0, "localhost", 7000, "/csound/stop")
endin

</CsInstruments>
<CsScore>
i2 0 2 1 0.2
</CsScore>
</CsoundSynthesizer>








