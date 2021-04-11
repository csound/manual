<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o ms2st.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1 

am, as    diskin2    "MSsample4.wav", 1, 0, 1
kwidth line 0, p3, 1                       ; from M to S
;kwidth = .5                                   ; original balance
al, ar ms2st  am,as,kwidth
outs al, ar

endin
</CsInstruments>
<CsScore>

i1 0 21.5 
e
</CsScore>
</CsoundSynthesizer>