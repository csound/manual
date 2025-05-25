<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>
0dbfs = 1

opcode Osci(a:k,f:k):a
  xout linenr(oscili(a,f),0.1,0.1,0.01) 
endop

instr One

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

  // schedule instr def
  schedule(Two,0,2,0.5,1000)

endin

instr Two
 obj:Opcode = create(oscili)
 sig:a = init(obj, p4, p5)
 sig:a = run(obj, p4, p5)
   out(sig)
 event_i("e", 0, 2)
endin

schedule(One,0,1)

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
