<CsoundSynthesizer>
<CsOptions>
-o dac -d
</CsOptions>
<CsInstruments>

instr 1

i1 compileorc "my.orc"
i2 readscore "i 1 0 1 10000 440"

turnoff
endin

</CsInstruments>
<CsScore>
i1 0 1
</CsScore>
</CsoundSynthesizer>
