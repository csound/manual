<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 1
0dbfs = 1

gifw ftgen 0,0,1024,20,2,1

instr 1
a1 diskin "fox.wav",1,0,1
a2 diskin "beats.wav",1,0,1
fenv pvslpc a1,1024,128,64,gifw
fexc pvsanal a2,1024,128,1024,1
fsig pvsfilter fexc,fenv, 1, 0.5
a3 pvsynth fsig
a3 dcblock a3
out a3
endin

</CsInstruments>
<CsScore>
i1 0 30
</CsScore>
</CsoundSynthesizer>
