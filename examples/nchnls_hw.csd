<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac ;;;realtime audio out
-iadc    ;;;realtime audio in
</CsOptions>
<CsInstruments>
; by Menno Knevel - 2024
  
sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1 

idacc,iadcc nchnls_hw
prints "\non this machine:"
prints "\nnumber of outputs = %d\n", idacc
prints  "number of inputs = %d\n\n", iadcc

endin

</CsInstruments>
<CsScore>
i1 0 0
e
</CsScore>
</CsoundSynthesizer>