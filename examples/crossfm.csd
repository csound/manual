<CsoundSynthesizer>
<CsOptions>
  -d -o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 10
nchnls = 2
0dbfs = 1

instr 1
  ifreq1 = p4
  ifreq2 = p5
  indx1  = p6
  indx2  = p7
  kamp linen 0.5, 0.01, p3, 0.5
  a1, a2 crossfm ifreq1, ifreq2, indx1, indx2, 1, 1, 1
  prints "freq1 = %f, freq2 = %f , index1 = %f, index2 = %f\n", \
                   ifreq1, ifreq2, indx1, indx2
  outs a1*kamp, a2*kamp
endin

</CsInstruments>
<CsScore>
f1 0 16384 10 1 0
i1 0 2 164.5 263.712 1.5 3
i1 2 2 164.5 263.712 2 3
i1 4 2 200 300 1 1.5
i1 4 2 250 500 1 2
e
</CsScore>
</CsoundSynthesizer>
