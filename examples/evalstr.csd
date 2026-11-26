<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac      ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o evalstr.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
sr = 44100
nchnls = 1
ksmps = 32
0dbfs = 1

; example by Stefano Cucchi - 2024

instr 2

ires1 evalstr {{
instr 3 
a1 poscil p4, p5
out a1 
endin 
}}
print ires1 ; ... and returns 0

 ;call the new instrument
 ;(note that the overall performance is extended)
scoreline_i "i 3 0 3 .2 415"

endin

</CsInstruments>
<CsScore>
i2 0 1
</CsScore>
</CsoundSynthesizer>