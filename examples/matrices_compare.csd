<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1

initial ftgen 1, 0, 128, 10, 1                         ; initial position = sine wave
idispl  ftgen 2, 0, 128, -7, .01, 128, .01             ; displace
imass   ftgen 3, 0, 128, -7, 5, 128, 5                 ; masses
icent   ftgen 4, 0, 128, -7, 1, 128, 1                 ; centering
idamp   ftgen 5, 0, 128, -7, -.1, 128, -.1             ; damping
itraj   ftgen 6, 0, 128, -7, 0, 128, 127               ; trajectory

a0 init 0
irate = .01
      
;scanu2 init, irate, ifndisplace, ifnmass, imatrix, ifncentr, ifndamp, kmass, kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, ain, idisp, id
scanu2   1,   irate,     2,          3,       p4,       4,       5,      20,      9,       0.1,    .9,     .5,    .1,     0,      0,     a0,    0,   2
;ar scans kamp, kfreq, ifntraj, id
a1 scans    1,   200,    6,     2

if p4 == 50 then
    prints  "\n  using binary matrix system\n", p4
else
    prints  "\n  and now the text matrix system\n", p4
endif

outs a1, a1
endin

</CsInstruments>
<CsScore>
; both matrices are to be found in the examples folder of the manual
f50 0 16384 -23  "string-128.matrxB"    ; binary matrix
f100 0 128  -44  "string-128.matrxT"    ; text matrix

i1 0 10     50
i1 12 10    100
e
</CsScore>
</CsoundSynthesizer>