<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>
0dbfs = 1

opcode Osci(a:k,f:k):a
  xout oscili(a,f)
endop

instr One

 // run at i-time
  myInstr:InstrDef = create({{ out Osci(p4,p5) }})
  myInstance:Instr = create(myInstr)
  err1:i = init(myInstance)

  // env, gliss
  env:k = linen(0.5,0.1,p3,0.1)
  slid:k = expon(440, p3, 880)

  // set p5
  setp(myInstance, 5, slid)
  // run at perf-time, set p4
  err2:k = perf(myInstance,env)

  // run at deinit time
  delete(myInstance) 
  delete(myInstr)

  // schedule instr def
  schedule(Two,0,2,0.5,1000)

endin

instr Two
 obj:Opcode = create(oscili)
 sig:a = init(obj, p4, p5)
 sig:a = perf(obj, p4, p5)
   out(sig*adsr(0.1,0.1,0.5,0.1))
 event_i("e", 0, 3)
endin

schedule(One,0,1)

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
