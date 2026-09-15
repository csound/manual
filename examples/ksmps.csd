<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac      ;;;realtime audio out

; By Stefano Cucchi - 2024

</CsOptions>
<CsInstruments>

sr = 48000 

; If you set ksmps = 24000, then kr = 2, so you hear 2 step every sec.
ksmps = 24000

; If you set ksmps = 32, then kr = 1500. You can hear a smooth glissando
;ksmps = 32 

nchnls = 2
0dbfs = 1

instr 1
  kamp = 0.4
  kfreq expseg p4, p3, p5
  a1 oscil3 kamp, kfreq, 1
  outs a1, a1
endin

</CsInstruments>
<CsScore>

f 1 0 524288 10 1

i 1 0 15 100  13000
e
</CsScore>
</CsoundSynthesizer>