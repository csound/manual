<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  --limiter=0.95 ;;;realtime audio out & and limit loud sounds
; For Non-realtime ouput leave only the line below:
; -o scansmao.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr=44100
ksmps=32
nchnls=2
0dbfs = 1

; by Menno Knevel - 2024
; listen carefully: changes are subtle as only one node of the 128 is replaced each time!

instr 1 ;replace 2 nodes- first 5 then 89

a0 init 0
irate = .002                              ; rather fast scanning rate
; scanu2 init, irate, ifndisplace, ifnmass, ifnmatrix, ifncentr, ifndamp, kmass,
scanu2     1,  irate,      6,         2,         3,        4,        5,     2,\
           9,      .01,    .01,   .1,    .9,    0,     0,     a0,    0,   1
 ;    kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, ain, idisp, id
kpos,kvel   scanmap     1, 1, 1, p4              ; just read what is going on with node 
            scansmap    p5, p6, 1, 1, 1, p4      ; set new parameters for this node     
  
prints "\nnode %d: set position to %0.1f, set velocity to %0.1f \n", p4, p5, p6
printks "         present  amplitude = %f, position = %f\n", .2, kvel, kpos

a1  scans ampdb(87), cpspch(7.00), 7,    1
a1  butlp   a1, 1500                             ; low pass filter   
asig  dcblock a1
outs asig*.00002, asig*.00002                   

endin

</CsInstruments>
<CsScore>

f1 0 128 -7 0 28 0 2 1 2 0 96 0     ; a pluck that is 10 points wide on the surface
f2 0 128 -7 1 128 1                 ; Masses
f3 0 16384 -23 "string-128.matrxB"  ; Spring matrix
f4 0 128 -7 1 128 1 ; uniform initial centering
f5 0 128 -7 1 128 1                 ; uniform damping
f6 0 128 -7 .01 128 .01             ; uniform initial velocity
f7 0 128 -7 1 128 128              ; trajectory

i1      0.0     5       5       0       0
i1      5.0     5       89      0       0
i1      11.0    5       5       0       1
i1      16.0    5       89      0       1
i1      22.0    5       5       1       0
i1      27.0    5       89      1       0
i1      33.0    5       5       1       1
i1      38.0    5       89      1       1
e

</CsScore>
</CsoundSynthesizer>