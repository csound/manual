<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac      ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o lpshold.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1

kfrq line 15, p3, .1
klp  lpshold kfrq, 0, 0, p3*0.25, 220, p3*0.5, 440, p3*0.25, 0
asig oscili .6, 440+klp, 1
     outs asig, asig

endin
</CsInstruments>
<CsScore>
; sine wave.
f 1 0 16384 10 1

i 1 0 10

e
</CsScore>
</CsoundSynthesizer>
