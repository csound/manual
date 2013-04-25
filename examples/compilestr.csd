<CsoundSynthesizer>
<CsOptions>
-o dac -d
</CsOptions>
<CsInstruments>

instr 1

i1 compilestr {{
instr 2 
a1 oscils p4, p5, 0
out a1 
endin 
}}
scoreline_i "i 2 0 1 10000 440"

turnoff
endin

</CsInstruments>
<CsScore>
i1 0 1

</CsScore>
</CsoundSynthesizer>
