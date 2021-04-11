<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o st2ms.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1 

al, ar    diskin2    "stereo.wav", 1, 0, 1
am, as st2ms  al,ar
outs am, as

endin
</CsInstruments>
<CsScore>

i1 0 21.5 
e
</CsScore>
</CsoundSynthesizer>