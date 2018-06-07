<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac           -iadc    ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o ftsave.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

giSine ftgen 0, 0, 2^10, 10, 1

instr 1
     ktrig init    1
     asig  poscil3 .5, 880, giSine
     kans  ftaudio ktrig, 100, "ccc.wav", 15, 1
     ktrig =       0
           outs    asig, asig

endin

</CsInstruments>
<CsScore>
f100 0 0 -1 "beats.wav" 0 0 0
i 1 0 2
e
</CsScore>
</CsoundSynthesizer>
