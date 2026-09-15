<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  --limiter=0.95 ;;;realtime audio out & and limit loud sounds
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o scanu2.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; by Menno Knevel 2024

instr 1 

a0 init 0                                                                       ; no audio injection
irate = .01
kenv adsr  .0001,  1,  .7,  .1                                                  ; envelope

if (p6 == 1) then
    prints  "\ninitial displacement condition = ramp"
elseif (p6 == 11) then
    prints  "\ninitial displacement condition = sine (hammer???)"
else
    prints  "\ninitial displacement condition = a pluck that is 10 points wide on the surface"
endif

if (p7 == 3) then
    prints  "\n                                 (binary matrix)\n\n"
else
    prints  "\n                                 (text matrix)\n\n"
endif

; scanu init, irate, ifndisplace, ifnmass, ifnmatrix, ifncentr, ifndamp, kmass,
;       kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, ain, idisp, id
scanu2 p6, irate, 6, 2, p7, 4, 5, 2, 9, .01, .01, .1, .9, 0, 0, a0, 1, 2

;ar scans kamp, kfreq, ifntraj, id
asig scans ampdb(p4)*kenv, cpspch(p5), 7, 2
outs asig*.00004, asig*.00004                                                   ; lower volume due to 0dbfs=1
        endin

</CsInstruments>
<CsScore>
; Initial displacement condition
f1 0 128 -7 0 64 1 64 0 ; ramp
f11 0 128 10 1 ; sine hammer
f111 0 128 -7 0 28 0 2 1 2 0 96 0 ; a pluck that is 10 points wide on the surface

; Masses
f2 0 128 -7 1 128 1

; Spring matrices
f3 0 16384 -23 "string-128.matrxB"
f33 0 16384 -44 "cylinder_128.matrxT"

; Centering force
f4 0 128 -7 1 128 1 ; uniform initial centering
; 0 128 -7 .001 128 1 ; ramped centering

; Damping
f5 0 128 -7 1 128 1 ; uniform damping

; Initial velocity - (displacement, vel, and acceleration
; Acceleration is from stiffness matrix pos effect - increases acceleration
f6 0 128 -7 .01 128 .01 ; uniform initial velocity

; exponential Trajectory
f7 0 128 -5 .001 128 128

i1 0  6 88      7.00    1       3
i1 7  2 88      5.00    1       3
i1 9  2 88      6.00    1       3

i1 12 6 86      7.00    11      3
i1 19 2 86      5.00    11      3
i1 21 2 86      6.00    11      3

i1 24 6 90      7.00    111     3
i1 31 2 90      5.00    111     3
i1 33 2 90      6.00    111     3

i1 37 6 88      7.00    1       33
i1 44 2 88      5.00    1       33
i1 46 2 88      6.00    1       33

i1 49 6 85      7.00    11      33
i 156 2 85      5.00    11      33
i1 58 2 85      6.00    11      33

i1 61 6 92      7.00    111     33
i1 68 2 92      5.00    111     33
i1 70 2 92      6.00    111     33
e
</CsScore>
</CsoundSynthesizer>