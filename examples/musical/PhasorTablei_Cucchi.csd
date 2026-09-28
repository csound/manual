<CsoundSynthesizer>

<CsOptions>

; Select audio/midi flags here according to platform
-odac   ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o phasor_tablei.wav -W ;;; for file output any platform

; By Stefano Cucchi 2020


</CsOptions>

<CsInstruments>

sr     =        44100
kr     =        4410
ksmps  =        10
nchnls =        2
0dbfs = 1


instr 1

kamp1 = 1.321
kcps1 = 0.067
krand1 randi kamp1, kcps1,  2

kamp2 = 1.061
kcps2 = 0.0514
krand2 randi kamp2, kcps2,  3

kamp3 = 0.92
kcps3 = 0.0865
krand3 randi kamp3, kcps3,  4

kamp4 = 1.412
kcps4 = 0.135
krand4 randi kamp3, kcps3,  5

krand5 randi 0.31, 0.13
krand6 randi 0.21, 0.132
krand7 randi 0.298, 0.23
krand8 randi 0.287, 0.15

;;;;MORPHING
kftndx linseg p8, p3*0.2, p9, p3*0.4, p10, p3*0.2, p11, p3*0.2, p12
iresfn = 2
iftfn = 1
ftmorf kftndx, iftfn, iresfn

;; p5 = frequenza carrier
;; p6 = frequenza modulator
kenvelopemod linseg 0, 3, p4, p3-6, p4, 6, 0
amodulator1 oscil kenvelopemod+krand5, p5+krand1, 2

acarf1 phasor (p6 + 10*krand7)
ifn = 3
ixmode = 1
ixoff = 0
iwrap = 1
acarrier1 tablei acarf1+amodulator1+42*krand2, ifn, ixmode, ixoff, iwrap

amodulator2 oscil kenvelopemod+krand6, p5+krand5, 2
acarf2 phasor (p6 + 15*krand8)
ifn = 3
ixmode = 1
ixoff = 0
iwrap = 1
acarrier2 tablei acarf2+amodulator2+38*krand4, ifn, ixmode, ixoff, iwrap

amodulator3 oscil kenvelopemod+krand3, p5+krand6, 2
acarf3 phasor (p6 + 15*krand7)
ifn = 3
ixmode = 1
ixoff = 0
iwrap = 1
acarrier3 tablei acarf3+amodulator3+28*krand2, ifn, ixmode, ixoff, iwrap

amodulator4 oscil kenvelopemod+krand6, p5+krand7, 2
acarf4 phasor (p6 + 13*krand5)
ifn = 3
ixmode = 1
ixoff = 0
iwrap = 1
acarrier4 tablei acarf4+amodulator4+(22*krand8), ifn, ixmode, ixoff, iwrap

kgenenvelop expseg 0.001, 1.8, p7, p3-3.6, p7, 1.8, 0.0001
outch 1 ,acarrier1 * kgenenvelop * 2
outch 2 ,acarrier2 * kgenenvelop * 2
outch 1 ,acarrier3 * kgenenvelop * 0.3
outch 2 ,acarrier4 * kgenenvelop * 0.3

endin



</CsInstruments>

<CsScore>

f1 0 8 -2 3 4 5 6 7 8 9 10
f2 0 4096 10 1 /*contents of f4 dont matter */
f3 0 4096 9 1 1 90
f4 0 4096 10 1 0.35 0 1 0.653
f5 0 4096 7 -1 2000 1 2096 -1
f6 0 4096 10 1 1 1
f7 0 4096 10 0 0 0 1
f8 0 4096 10 0 0 1 
f9 0 4096 10 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 
f10 0 4096 10 1


i1 0 40 0.03 300 200 0.123	0 5 7 6 2
i1 15 10 0.09 9000 3000 0.039   7 0 1 2 3 
i1 30 10 0.02 150 100 0.125     4 6 4 7 0

i1 42 12 0.9 80 40 0.34 6 7 6 7 7
i1 54 12 0.9 68 70 0.34 1 7 2 0 6

i1 66 12 4.9 800 40 0.14 6 0 6 0 7
i1 66 12 4.9 1600 41 0.14 6 0 6 0 7


e
</CsScore>

</CsoundSynthesizer>
