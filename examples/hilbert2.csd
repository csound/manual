<CsoundSynthesizer>
<CsOptions>
 -odac
</CsOptions>
<CsInstruments>

nchnls = 2

instr 1

asig  oscili   0dbfs*p4, p5
a1,a2 hilbert2 asig, 1024, 256
      outs     a1, a2

endin

</CsInstruments>
<CsScore>
i1 0 10 0.5 440
</CsScore>
</CsoundSynthesizer>