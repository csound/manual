<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  --limiter=0.95 ;;;realtime audio out & and limit loud sounds
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o scans.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr=44100
ksmps=32
nchnls=2
0dbfs=1

; example by Menno Knevel 2024

instr 1 

a0  = 0                                              ; no audio input
;scanu init, irate, ifnvel, ifnmass, ifnstif, ifncentr, ifndamp, kmass, kstif, kcentr, kdamp, ileft, iright, kpos, kstrngth, ain, idisp, id
scanu 1,     .01,    6,       2,       3,     4,        5,       2,     .1,    .1,     -.01,  .1,    .5,     0,    0,        a0,  1,     2

if (p6 == 0) then
    asig  scans ampdb(p4), cpspch(p5), 7, 2          ; exponential trajectory
elseif (p6 == 1) then
    asig  scans ampdb(p4), cpspch(p5), 77, 2         ; linear trajectory
else
    asig  scans ampdb(p4), cpspch(p5), 777, 2        ; linear trajectory but only a small portion
endif

asig    *=  .000025                                  ; compensate volume due to 0dbfs = 1
outs asig, asig
endin

</CsInstruments>
<CsScore>
f1 0 128 7 0 64 1 64 0
f2 0 128 -7 1 128 1
f3 0 16384 -23 "string-128.matrxB"   ; binary matrix, can be found in the examples folder of the manual
f4  0 128 -7 0 128 2
f5 0 128 -7 1 128 1
f6 0 128 -7 0 128 0
f7 0 128 -5 .001 128 128             ; exponential trajectory
f77 0 128 -7 0 128 128               ; linear trajectory
f777 0 128 -7 10 128 20              ; linear trajectory but only a small portion

i1      0       9       90      6.00    0
i1      9       12      90      7.00    0
i1      13      17      90      5.00    0
i1      31      9       90      6.00    1
i1      40      12      90      7.00    1
i1      44      17      90      5.00    1
i1      62      9       90      6.00    2
i1      71      12      90      7.00    2
i1      74      17      90      5.00    2
e
</CsScore>
</CsoundSynthesizer>