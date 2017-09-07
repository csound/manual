<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>


instr 1

a1 diskin "fox.wav"
a2 ftconv a1, 2, 256
   out a2*0.25
   
endin

</CsInstruments>
<CsScore>
f1 0 131072 1 "ir.wav" 0 0 1
f2 0 131072 53 1 3 

i1 0 5
</CsScore>
</CsoundSynthesizer>