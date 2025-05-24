<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>
0dbfs = 1

opcode Osci(a:k,f:k):a
  xout linenr(oscili(a,f),0.1,0.1,0.01) 
endop

instr 1

 // run at i-time
  myInstr:InstrDef = create({{ out Osci(p4,k(p5)) }})
  myInstance:Instr = create(myInstr)
  err1:i = init(myInstance,0.5,440)

 // run at perf-time
  err2:k = perf(myInstance)
  slid:k = expon(440, p3, 880)
  setp(myInstance, 5, slid)

  // run at deinit time
  delete(myInstance) 
  delete(myInstr)

endin

</CsInstruments>
<CsScore>
i1 0 2
</CsScore>
</CsoundSynthesizer>
