<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac      ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o schedulek.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; By Stefano Cucchi 2024
sr = 44100      
ksmps = 32      
nchnls = 2              
0dbfs  = 1              

instr 1

kfreqnote randomh 0.1, 6.3, 2
kTrigger  metro   kfreqnote 
if kTrigger == 1 then ;

schedulek 10, 0, 0.1 ;call the instrument
endif

endin

instr 10

a1 oscili 0.2, 440, 2
outs a1, a1

endin

</CsInstruments>
<CsScore>
f 2 0 4096 10 1 0.9 0.8 0.7 0.6

i 1 0 10
e
</CsScore>
</CsoundSynthesizer> 