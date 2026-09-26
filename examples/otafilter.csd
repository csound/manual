<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>

0dbfs = 1
nchnls = 2

instr 1

a1 rand p4
af expon 20, p3, 20000
a2,a3 otafilter a1, af, 1.2, 1.5
   out a2, a3

endin

</CsInstruments>
<CsScore>
i1 0 15 0.5
</CsScore>
</CsoundSynthesizer>