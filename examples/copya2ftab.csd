<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
kS[] init 1024
kS   tabgen 0,1024
     scalet kS,0,1
     copy2ftab kS, 1
aa   oscil 0.5, 440, 1
     out aa
endin

</CsInstruments>
<CsScore>
i 1 0 0.2
e
</CsScore>
</CsoundSynthesizer>
