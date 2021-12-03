<CsoundSynthesizer>

<CsInstruments>
ksmps = 32
0dbfs = 1.0
nchnls = 2

instr 1
;; rhythm array - these values are multiplied by tempo (ticks) in BPM
irhythm0[] fillarray 1, 1.5, 0.5, 0.5, 0.5, 0.5, 1.5, 1
;; instrument array - instrument number to render for each step
iinsts0[] fillarray 11, 12, 13, 14, 15, 16, 17, 18
;; note array - here in cpsmidinn and amplitudes - esentially the 'p4' and 'p5' output from sequ
inotes[][] init 2,8
inotes fillarray 60, 61, 62, 63, 64, 65, 66, 67, \
                 0.9,0.7,0.6,0.8,0.9,0.6,0.7,0.6
;; NOTE: this can be any sequence of values
;; variable tempo
kspeed linseg 85, p3*.7, 85, p3*.3, 240
;; rhythms, insts, notes, bpm, length, mode, verbose
kSeq sequ irhythm0, iinsts0, inotes0, kspeed, 8, p4, 0
endin

instr 11, 12, 13, 14, 15, 16, 17, 18
kenv linseg 0, p3*0.01, 1, p3*.99, 0
asig oscil p5, cpsmidinn(p4)
outall asig * kenv
endin

</CsInstruments>

<CsScore>
i1 0 15 0 ;; forward mode
s
f0 1
s
i1 0 15 -1 ;; backward mode
s
f0 1
s
i1 0 15 -2 ;; forward and backward mode
s
f0 1
s
i1 0 15 -3 ;; random
s
f0 1
s
i1 0 6 -4 ;; play forward once and stop
s
f0 1
s
i1 0 6 -5 ;; play backward once and stop
s
f0 1
s
i1 0 30 1 ;; mutate after each step
s
f0 1
s
i1 0 30 2 ;; mutate each second step
s
f0 1    
s
i1 0 30 4 ;; mutate every four steps
e
e
</CsScore>
</CsoundSynthesizer>
