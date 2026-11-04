<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  --limiter=0.95 ;;;realtime audio out & and limit loud sounds
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o gen44-2.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; by Menno Knevel 2024

instr 1                                                     ; move the grain table

initial ftgenonce 1, 0, 1024, 10, 1                         ; initial position = sine wave
idispl  ftgenonce 2, 0, 1024, -7, .01, 1024, .01            ; displace
imass   ftgenonce 3, 0, 1024, -7, 5, 1024, 5                ; masses
icent   ftgenonce 4, 0, 1024, -7, .01, 1024, .1             ; centering
idamp   ftgenonce 5, 0, 1024, -7, -.1, 1024, -.21           ; damping
itraj   ftgenonce 6, 0, 1024, -7, 0, 1024, 1024             ; trajectory
iw      ftgenonce 7, 0, 1024, 20, 2                         ; Hanning window for GEN20

a0 = 0                                                      ; no audio injection
kline line .07, p3, 0                                       ; simple envelope
;scanu2 init, irate, ifndisplace, ifnmass, imatrix, ifncentr, ifndamp, kmass, kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, ain, idisp, id
scanu2   1,   .003,     2,          3,       100,       4,       5,      10,      6,       0.1,    .9,     .5,    .1,     0,      0,     a0,    0,   -1
aL grain2 p4, p4, 2, 25, 1, 7
aR grain2 p4, p4, 2, 25, 1, 7
aL  dcblock aL 
aR  dcblock aR 
outs aL * kline, aR * kline

endin

</CsInstruments>
<CsScore>
f100 0  0   -44  "circularstring_1024.matrxT"    ; text matrix, to be found in manual/examples

i1  0  20  466.16376098248423   
e
</CsScore>
</CsoundSynthesizer>