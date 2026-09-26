<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  --limiter=0.95 ;;;realtime audio out & and limit loud sounds
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o scanu.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; by Menno Knevel 2024

instr 1 

a0  = 0     ; no external input
;   scanu init, irate, ifnvel, ifnmass, ifnmatrix, ifncentr, ifndamp, kmass, kstif, kcentr, kdamp, ileft, iright, kpos, kstrngth, ain, idisp, id
    scanu p7,     p6,    6,       2,       3,        4,        5,       2,     .1,    .1,     -.02,  .1,    .5,     0,     0,     a0,  0,     2

if (p7 == -1) then
    prints "\nthe hammer option!\n"
else
    prints  "\ninitial position of the masses...\n"
endif
;ar scans kamp,      kfreq,      ifntraj, id
a1  scans ampdb(p4), cpspch(p5),    7,    2
a2  scans ampdb(p4), cpspch(p5)*1.01, 7,  2           ; slightly out of tune
a1  *= 0.00006                                        ; lower amplitude due to 0dbfs  = 1
a2  *= 0.00006                                      
a1  dcblock2  a1                                      ; remove DC offset
a2  dcblock2  a2                                     
outs a1, a2

endin

</CsInstruments>
<CsScore>

f1 0 128 7 0 64 1 64 0     ; Initial condition
f2 0 128 -7 1 64 .45 64 1  ; Masses
f3 0 16384 -23 "string-128.matrxB" ; Matrix, a binary one. Can be found in manual/examples
f4 0 128 -7 0 64 1 64 0    ; Centering force
f5 0 128 -7 0 64 1 64 0    ; Damping
f6 0 128 -7 0 128 0        ; Initial velocity
f7 0 128 -7 0 64 127 64 0  ; Trajectory

i1      0.0     8       86      6.00    0.001   1
i1      8.0     8       89      6.01    0.001   -1 
i1      17.0    10      86      6.00    0.005   1
i1      27.0    10      89      6.01    0.005   -1
i1      38.0    120     86      6.00    0.1     1
i1      159.0   120     89      6.01    0.1     -1
e
</CsScore>
</CsoundSynthesizer>