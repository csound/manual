<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 1
0dbfs = 1

instr 1
a1 diskin "fox.wav",1,0,1
a2 diskin "flute.aiff",1,0,1
fenv pvsanal a1,1024,256,1024,1
kcfs[],krms,kerr pvscfs fenv,30
a3 allpole a2*krms*kerr,kcfs
a3 dcblock a3
out a3
endin

</CsInstruments>
<CsScore>
i1 0 30
</CsScore>
</CsoundSynthesizer>

