<CsoundSynthesizer>
<CsOptions>
-n 
</CsOptions>
<CsInstruments>
0dbfs=1

instr 1
   opcodeinfo(oscili)
   opc:Opcode = create(oscili,3)
   prints("selected overload 3:\n")
   opcodeinfo(opc)
   exitnow(0)
endin

schedule(1,0,0)

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>

