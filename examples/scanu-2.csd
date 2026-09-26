<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  --limiter=0.95 ;;;realtime audio out & and limit loud sounds
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o scanu-2.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; by Menno Knevel 2024

instr 1 ; play sample

a0      loscil   .8, p4, 200                                                    ; audio sample with loop points
prints "\nthe drum sample has an frequency of %d\n", p4
outs a0, a0
endin

instr 2 ; inject sample

a0      loscil   .5, p6, 200                                                    ; audio injection 
prints "...and is injected into the system..."
if (p6 == 0) then
    prints  "sample injection has no effect!"
endif

kenv    linseg    1, p3*.8, .1, p3*.2, 0                                        ; simple envelope
;scanu init, irate, ifnvel, ifnmass, ifnmatrix, ifncentr, ifndamp, kmass, kstif, kcentr, kdamp, ileft, iright, kpos, kstrngth, ain, idisp, id
 scanu  1,   .01,    6,       2,       3,          4,        5,     2,     .1,    .1,     -.02,   .1,    .5,     0,      0,    a0,  0,     2
;ar scans kamp,      kfreq,      ifntraj, id
a1  scans ampdb(p4)*kenv, cpspch(p5), 7,       2
a2  scans ampdb(p4)*kenv, cpspch(p5)*1.01, 7,       2                           ; slightly out of tune (stereo)
a1  *= 0.00005                                                                  ; lower amplitude due to 0dbfs  = 1
a2  *= 0.00005                                      
a1  dcblock2  a1                                                                ; remove DC offset
a2  dcblock2  a2                                     
outs a1, a2
endin

</CsInstruments>
<CsScore>
f1 0 128 7 0 64 1 64 0                               ; Initial condition
f2 0 128 -7 1 64 .45 64 1                            ; Masses
f3 0 16384 -23 "string-128.matrxB"                   ; Spring matrix
f4 0 128 -7 0 64 1 64 0                              ; Centering force
f5 0 128 -7 0 64 1 64 -0.01                          ; Damping
f6 0 128 -7 0 128 0                                  ; Initial velocity
f7 0 128 -7 0 64 127 64 0                            ; Trajectory
f200 0 0 1 "drumsMlp.wav" 0 0 0  

i1      0.0     4       0
i1      34.0    4       4
i1      68.0    4       18
i2      4.0     30      88      6.00    0
i2      38.0    30      70      6.00    4
i2      72.0    30      65      6.00    18
e
</CsScore>
</CsoundSynthesizer>