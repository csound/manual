<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac       ;   -iadc    ;;;RT audio out
; For Non-realtime ouput leave only the line below:
; -o Mixer.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
  att:k = expon(0.01, p3, 1)    ;create an attack
  Out:a = poscil(0.7, 440)
  mixersetlevel(1, 3, att)      ;impose attack on the gain level
  mixersend(Out, 1, 3, 0)       ;send to channel 0
endin

instr 2
  Out:a = vco2(0.5, 110)        ;saw wave
  mixersetlevel(2, 3, 0.25)     ;set level to .25 of vco2
  mixersend(Out, 2, 3, 1)       ;send to channel 1
endin

instr 3 ;mix instr.1 and 2 with reverb
  gain1:k = mixergetlevel(1, 3)       ;get level form buss 3
  gain2:k = mixergetlevel(2, 3)       ;get level form buss 3
  a1 = mixerreceive(3, 0)             ;receive channel 0
  a2 = mixerreceive(3, 1)             ;receive channel 1
  Out:a = a1*gain1 + a2*gain2         ;mix them
  outL:a, outR:a = reverbsc(Out, Out,  0.85, 12000)  ;add a nice reverb
  out(outL, outR)
  mixerclear()
endin

</CsInstruments>
<CsScore>
;f1 0 4096 10 1

i1 0 2
i2 0 2
i3 0 8  ;reverb stays on for 8 sec.

e
</CsScore>
</CsoundSynthesizer>
