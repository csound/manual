<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>
0dbfs=1

instr 1
   obj:Opcode create oscili
   a1 run obj, p4, p5, p6
      out a1
endin

schedule(1,0,1,0.5,440,-1)
event_i("e",0,2)
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>

