<CsoundSynthesizer>

<CsOptions>

</CsOptions>

<CsInstruments>

sr = 48000
ksmps = 32
nchnls = 1

instr scan
a0 init 0

irate = .01

kpos line 0, p3, 128
;kpos randh abs(128), 3

; scanu init, irate, ifnvel, ifnmass, ifnstif, ifncentr, ifndamp, kmass, kstif,
;       kcentr, kdamp, ileft, iright, kpos, kstrngth, ain, idisp, id
scanu2 1, irate, 6, 2, 3, 4, 5, 2, 30, .01, .01, .1, .9, 0, 0, a0, 1, 2

;ar scans kamp, kfreq, ifntraj, id
a1 scans ampdb(p4), cpspch(p5), 7, 2
out a1
endin

</CsInstruments>
<CsScore>
; Initial displacement condition
f1 0 16 10 1 ; sine hammer

; Masses
f2 0 16 -7 1 16 1

; Spring matrices
f3 0 256 -44 "string_with_extras-16.mat"

; Centering force
f4 0 16 -7 1 16 1 ; uniform initial centering

; Damping
f5 0 16 -7 1 16 1 ; uniform damping

; Initial velocity - (displacement, vel, and acceleration
; Acceleration is from stiffness matrix pos effect - increases acceleration
;
f6 0 16 -7 .01 16 .01 ; uniform initial velocity

; Trajectories
f7 0 16 -5 .001 16 16

i"scan" 2 2 86 7.00
i"scan" 4 2 86 5.00
i"scan" 6 2 86 6.00
i"scan" 8 2 86 8.00
i"scan" 10 2 98 10.00

e

</CsScore>
</CsoundSynthesizer>
