<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o dbfsamp.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1

iamp = p4
idb  = dbfsamp(iamp)
     print idb
asig vco2 iamp, 110     ;sawtooth
     outs asig, asig

endin

</CsInstruments>
<CsScore>

i 1 0 1 0.0000305
i 1 + 1 0.0031
i 1 + 1 0.03
i 1 + 1 0.3
i 1 + 1 0.9
e

</CsScore>
</CsoundSynthesizer>