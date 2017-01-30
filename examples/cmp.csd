<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 6
0dbfs = 1.0

instr 1
    a0 linseg 0, p3, 1
    a1 linseg 1, p3, 0
    aout cmp a0, "<", a1
    outch 1, a0
	outch 2, a1
    outch 3, aout
endin

instr 2
    a0 linseg 0, p3, 1
    aout cmp a0, "<=", 0.5
    outch 4, aout
endin

instr 3
    a0 linseg 0, p3, 1
    aout cmp a0, "!=", 0.5
    outch 5, aout
endin

</CsInstruments>
<CsScore>
i 1 0 2
i 2 0 2
i 3 0 2

</CsScore>
</CsoundSynthesizer>

