<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac      ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o tabw.wav -W ;;; for file output any platform

;By Stefano Cucchi 2024
</CsOptions>
<CsInstruments>

sr = 44100 
ksmps = 32 
nchnls = 2 
0dbfs  = 1 

instr 1

tabw p4, 0, 2 ; write content of function number "2"
tabw p5, 1, 2
tabw p6, 2, 2
tabw p7, 3, 2
tabw p8, 4, 2

kamp oscili 1, 1/p3, 2 ;use f2 as envelope
asig poscil kamp, 440, 1    
     outs asig, asig

endin

</CsInstruments>
<CsScore>
f 1 0 8192 10 1 0.6 0 0.4 0.6  
f2 0 5 2 0 0 0 0 0

i1 0 3   0 0.9  0 0.2 0.9 ; every note has different envelope
i1 4 3   1 0.01 1 0.5  0
i1 8 3   1  1   0 0.5  0
e
</CsScore>
</CsoundSynthesizer>
