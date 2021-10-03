<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac             ;;;RT audio out
; For Non-realtime ouput leave only the line below:
;-o delay1.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; by John ffitch and Menno Knevel

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
kfreq line 1000, p3, sr/2
a0    oscili 1, kfreq       ; frequency sweep
a1    delay1  a0            ; simple Lowpass filter
; ...mix direct & delayed signal...
aout  = (a0+0.99*a1)/2      ; aout and a0 output are used to create the screenshot below...
aout  *= .1                 ; but here amplitude is lowered  a lot...
a0    *= .1                 ; ...just to demonstrate the sounding result.
outs  aout, a0              ; output direct signal on right channel and the filtered signal on left channel

endin

</CsInstruments>
<CsScore>
i 1 0.0 3
e
</CsScore>
</CsoundSynthesizer>
