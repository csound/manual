<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o Poisson_Cucchi -W ;;; for file output any platform

; By Stefano Cucchi - 2024

</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32 
nchnls = 2
0dbfs  = 1

instr 1

klambda1 linseg p4, p3, p5
kindex poisson klambda1

klambda2 linseg p6, p3, p7
ktrigfreq poisson klambda2

ksig poscil 1, ktrigfreq
ktrig trigger ksig, 0, 0

schedkwhen ktrig, 0, 20, 10, 0, 0.2, kindex, 10

endin 

instr 10      

kcnt = p4
kpc     table   kcnt, p5         
kcps    =     cpspch(kpc)   

asig1    oscil   0.5, kcps, 1    

kenvelope linseg 0, p3*0.5, 1, p3*0.5, 0

asig1 = asig1*kenvelope
outs asig1, asig1  

endin       

</CsInstruments>
<CsScore>

f 1 0 4096 10 1 0 1 0 1 0 0 1 1 

f 10 0 24 -2 8.00 8.01 8.02 8.03 8.04 8.05 8.06 8.07 8.08 8.09 8.10 8.11 9.00 9.01 9.02 9.03 9.04 9.05 9.06 9.07 9.08 9.09 9.10 9.11 

i1 0 30 0 23 2 17
          
e
</CsScore>
</CsoundSynthesizer>
