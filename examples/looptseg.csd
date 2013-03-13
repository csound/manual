<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac      ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
;-o looptseg.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1

kfreq linseg 10, p3*.5, 1, p3*.5, 5	; vary speed
ktyp linseg 100, p3*.5, -5, p3*.5, -20	; change form of segment
;klp looptseg kfreq,ktrig,ktime0,kvalue0,ktype0,ktime1,kvalue1,ktype1,ktime2,kvalue2,ktype2,ktime3,kvalue3
 klp looptseg kfreq,  0,    0,     0,     ktyp,   .6,     .9,     -10,    .8,     .4,    1,     .1,     0 

asig poscil3 klp, 440, 1
     outs asig, asig

endin
</CsInstruments>
<CsScore>
; sine wave.
f 1 0 16384 10 1

i 1 0 12

e
</CsScore>
</CsoundSynthesizer>
