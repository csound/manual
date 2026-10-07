<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o ATSreadnz.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; by Menno Knevel - 2023

res:i = systemi(1, {{ atsa Mathews.wav Mathews.ats }}) ; default settings

instr 1 
  time:k = line(0, p3, 2)
  energy:k = atsreadnz(time, "Mathews.ats", p4) ; return energy from band p4
  Noise:a = randi(energy, 5000)
  out(Noise*p5, Noise*p5)          ; compensate amplitude differences!
endin

</CsInstruments>
<CsScore>
; 3 different energy bands, compensated by different amplitude values
i 1 0  10      6        0.015    ; loud!!
i 1 11 10      12       0.4      ; less energy in this band              
i 1 22 10      17       1        ; and even less...
e

</CsScore>
</CsoundSynthesizer>