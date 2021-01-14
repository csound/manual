<CsoundSynthesizer>

<CsOptions>
-o dac -M hw:1,0,0
</CsOptions>

<CsInstruments>

nchnls = 2
0dbfs = 1

instr 2
 kk ctrlpreset 0, 1, 21,48, 22,94, 23,1, 24,6, 25,24
 kk ctrlpreset 0, 1, 21,59, 22,57, 23,76, 24,55, 25,77
 kk ctrlpreset  0, 1, 21,59, 22,57, 23,76, 24,55,25,77 
 kk ctrlpreset 11,1, 21,100, 22,12, 23,13, 24,6, 25,24 ; french horn
 kk ctrlpreset 0,1, 21,51, 22,83, 23,48, 24,33, 25,24 ; harpsichord
 kk ctrlpreset 0,1, 21,70, 22,20, 23,48, 24,33, 25,24
 kk ctrlpreset 0,1, 21,70, 22,52, 23,0, 24,33, 25,68
 kk ctrlpreset 0, 1, 21,61, 22,0, 23,2, 24,7, 25,1
 kk ctrlpreset 0, 1, 21,61, 22,0, 23,2, 24,7, 25,2
 kk ctrlpreset 0, 1, 21,61, 22,0, 23,2, 24,7, 25,3
 kk ctrlpreset 25, 1, 21,61, 22,0, 23,2, 24,7, 25,4

 ctrlprintpresets

 ctrlselect 1

 turnoff
endin


instr  1

kc[] init 5

icps cpsmidi
iamp ampmidi 0.6


kgain midic7  21, 0,1
kcar midic7  22, 1,10
kmod midic7  23, .1,10
kndx midic7  24, 1,30
kndx port kndx,.1
irel midic7 25, .01,2


asig  foscil iamp, icps, kcar, kmod, kndx, 1
kmgate linsegr 0, .001, 1, irel, 0

outs  asig*kmgate*kgain, asig*kmgate*kgain
 
kc   ctrlsave 1, 21,22,23,24,25 

kchar  sensekey ; NOTE: CC values are printed to console only when instr is active (playing)
if kchar != 97 goto end  ; ascii character "97" is the letter 'a'
  ctrlprint kc
end:

if kchar<49 || kchar>58 goto end1

ctrlselect kchar-48

end1:

endin

</CsInstruments>

<CsScore>

f1 0 8192 10 1

f0 6000

i2 0 0.1
e

</CsScore>


</CsoundSynthesizer>
