<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  --limiter=0.95 ;;;realtime audio out & and limit loud sounds
; For Non-realtime ouput leave only the line below:
; -o scans-2.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; example by Menno Knevel 2024

sr=44100
ksmps=32
nchnls=2
0dbfs=1

instr 1 
initial ftgenonce 1, 0, 128, 10, 1                                               ; initial position = sine wave
idispl  ftgenonce 2, 0, 128, -7, .01, 128, .04                                   ; displace
imass   ftgenonce 3, 0, 128, -7, 5, 128, 15                                      ; masses
icent   ftgenonce 4, 0, 128, -7, 2.01, 128, .09                                  ; centering
idamp   ftgenonce 5, 0, 128, -7, -.1, 128, -.01                                  ; damping
itraj1  ftgenonce 6, 0, 128, -7, 0, 128, 128                                                    ; trajectory 1
itraj2  ftgenonce 66, 0, 128, -23, "straightline_max128_128.traj"              ; trajectory 2
itraj3  ftgenonce 666, 0, 128, -23, "128-spiral-8,16,128,2,1over2.traj"        ; trajectory 3

a0 = 0                                                                          ; no audio 
kline line .7, p3, 0                                                            ; simple envelope

itrajectory =   p6
if (p6 == 6) then                                                               
    prints "\nlinear trajectory, reading through all of the masses\n"
elseif (p6 == 66) then                                                          
    prints "\nthe same linear trajectory but written as an ASCII file\n"
else
    prints "\na spiral trajectory - see images below\n"
endif

;scanu2 init, irate, ifndisplace, ifnmass, imatrix, ifncentr, ifndamp, kmass, kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, ain, idisp, id
scanu2   1,   .02,     2,          3,      100,       4,       5,      10,      0.6,       0.1,    .9,     .5,    .1,     0,      0,     a0,    0,   20
asigL  scans kline, p4, itrajectory, 20
asigR  scans kline, p4*1.01, itrajectory, 20        ; stereo
asigL  dcblock asigL
asigR  dcblock asigR 
outs asigL, asigR
endin

</CsInstruments>
<CsScore>
f100 0  0   -44  "string_128.matrxT"    ; text matrix

i1      0.0     4       130.8127825             1.0     6
i1      5.0     4       109.99999987361387      1.0     66
i1      10.0    5       146.8323837899985       1.0     666
e
</CsScore>
</CsoundSynthesizer>