<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac             ;;;RT audio out
; For Non-realtime ouput leave only the line below:
; -o wgpluck.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; by Menno Knevel 2021

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1

icps = 220
iamp = 1
kpick = 0.5
iplk = 0
idamp = p4
ifilt = p5

axcite oscil 1, 1, 1                ; used to excite the pluck
apluck wgpluck icps, iamp, kpick, iplk, idamp, ifilt, axcite
apluck  dcblock2    apluck          ; gets rid of DC offset
outs apluck, apluck

endin

</CsInstruments>
<CsScore>
f 1 0 16384 10 1        ; sine wave.

i 1 0 8     10      1000  ; long note with rapidly decaying upper partials
i 1 + 8     30      10    ; a shorter, brighter note
e
</CsScore>
</CsoundSynthesizer>
