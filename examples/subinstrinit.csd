<CsoundSynthesizer>
<CsOptions>
; This example prints messages and makes no sound.
-n -d
; By Stefano Cucchi 2020
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
; Choose a child with p4 and pass p5 as the child's p4.
subinstrinit p4, p5
endin

instr 2
prints "Instrument 2 initialized with p4 = %g\n", p4
endin

instr 3
prints "Instrument 3 initialized with p4 = %g\n", p4
endin

instr 4
prints "Instrument 4 initialized with p4 = %g\n", p4
endin


</CsInstruments>
<CsScore>


i1 0 2 2 10
i1 2 2 3 20
i1 4 2 4 30

e

</CsScore>
</CsoundSynthesizer>
