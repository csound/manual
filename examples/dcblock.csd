<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
;-o dcblock.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1 ;add DC to "drumsMlp.wav"

asig soundin "drumsMlp.wav"
asig = asig+0.15  ; adds DC of 0.15
     outs asig, asig
endin

instr 2 ;dcblock audio

asig soundin "drumsMlp.wav"
asig = asig+0.15  ; adds DC
adc  dcblock asig       ;remove DC again
     outs adc, adc

endin

</CsInstruments>
<CsScore>

i 1 0 2
i 2 2 2
e

</CsScore>
</CsoundSynthesizer>