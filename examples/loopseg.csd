<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac      ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o loopseg.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1

kfreq line 1, p3, 5	; speed up
kval  = p4		; value of second segment
klp   loopseg kfreq, 0, 0, 0, 0, kval, 1, 1, 0
asig  poscil3 klp, 440, 1
      outs asig, asig

endin
</CsInstruments>
<CsScore>
; sine wave.
f 1 0 16384 10 1

i 1 0 5 .05
i 1 6 5 .5
e
</CsScore>
</CsoundSynthesizer>
