<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  --limiter=0.95 ;;;realtime audio out & and limit loud sounds
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o scanu2-2.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; by Menno Knevel 2024

instr 1 ; play with k-rate parameters

a0 init 0
irate = .2

kmass   line    10,  p3, 1
kstiff  line    .30, p3, .7
kcenter line    .3,  p3, .01
kdamp   line    -.01, p3, -.1
kdisplace line   0,  p3,  1

scanu2 1, irate, 6, 2, 3, 4, 5, kmass, kstiff, kcenter, kdamp, .1, .7, 1, kdisplace, a0, 1, 5
asig scans ampdbfs(p4), cpspch(p5), 7, 5
asig dcblock2 asig
asigL, asigR    reverbsc asig, asig, .6, 10000, sr, .5, 1  ; add some reverb
outs asigL+asig, asigR+asig
endin

</CsInstruments>
<CsScore>
; Initial displacement condition
f1 0 1024 10 1                  ; sine
f2 0 1024 -7 1 1024 1           ; Masses
; Spring text matrix
f3 0  0   -44  "circularstring_1024.matrxT"    ; text matrix, to be found in manual/examples
f4 0 1024 -7 1 1024 1 ; uniform initial centering
f5 0 1024 -7 1 1024 1 ; uniform damping
; Initial displacement - (displacement, vel, and acceleration
; Acceleration is from stiffness matrix pos effect - increases acceleration
f6 0 1024 -7 .01 1024 .01 ; uniform initial velocity-displacement
f7 0 1024 -5 .001 1024 1024     ; Trajectory

i1      0.0     6.5     -6      7.00
i1      6.5     6.5     -9      7.07    ; 2 notes
i1      6.5     6.5     -9      7.04
e
</CsScore>
</CsoundSynthesizer>