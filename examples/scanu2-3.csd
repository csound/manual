<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  --limiter=0.95 ;;;realtime audio out & and limit loud sounds
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o scanu2-3.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; by Richard Boulanger 2024

instr scan      ; show the pluck options

a0 init 0
irate = .04

kmass line 2,p3,1
kstiff line 10,p3,10
kcenter line 5,p3,6
kdamp line 1,p3,2
kpos line .4,p3,.5

;scanu2 init,irate,ifndisplace,ifnmass,ifnmatrix,ifncentr,ifndamp,kmass,kmtrxstiff,
; kcentr, kdamp, ileft, iright, kpos, kdisplace, ain, idisp, id
scanu2 p6, irate, 6, 2, 3, 4, 5, kmass, kstiff, kcenter, kdamp, p7, p8, kpos, .02, a0, 1, 2
a1 scans ampdbfs(p4), cpspch(p5), 7, 2
a1 dcblock2 a1
outs a1, a1
endin

</CsInstruments>
<CsScore>
f1 0 16 10 1 ; Sine Hammer
f11 0 16 10 1 .5 .3 .2 .1 .01 ; Sawlike hammer
f111 0 16 10 1 0 .73 0 .53 0 .45 0 .17 0 .02 0 .002 ; Pulselike hammer
f2 0 16 -7 8 16 8 ; Masses
f3 0 0 -44 "string_with_extras-16.matrxT" ; Spring matrix, to be found in the examples folder of the manual
f4 0 16 -7 .07 16 .07 ; Centering force, uniform initial centering
f5 0 16 -7 .04 16 .04 ; Damping, uniform damping
f6 0 16 -7 .01 16 .01 ; uniform initial velocity-displacement
f7 0 16 -5 15 16 1 ; Trajectory


i"scan" 0 3 6 7.00 -1 .5 .5 ; pluck in middle
s
i"scan" 0 3 2 7.00 -1 .1 .1 ; pluck at left
s
i"scan" 0 3 0 7.00 -1 .2 -.8 ; 2 plucks up left and down right
s
i"scan" 0 3 -6 7.00 1 .2 .8 ; sine hammer - ignore pluck position
s
i"scan" 0 3 -6 7.00 11 .8 .2 ; sawlike hammer - ignore pluck position
s
i"scan" 0 3 -6 7.00 111 .1 .6 ; pulselike hammer - ignore pluck position
e
</CsScore>
</CsoundSynthesizer>