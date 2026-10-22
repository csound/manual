<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1
    while (p4>0) do
        p4 = p4 - 1
        if (p4 == 2) then
            continue
        endif
        print p4
    od
endin

</CsInstruments>
<CsScore>
i1 0 0 4
</CsScore>
</CsoundSynthesizer>
