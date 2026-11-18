<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
-d        ;;;no display
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o poscil.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

seed(0)
sine@global:i = ftgen(0, 0, 2^10, 10, 1)

instr 1
  dur:i = p3

  env_peak:i = random(0, 1)                   ;where is the envelope peak
  sig:a = poscil(0.8, 220, sine)
  env:a = transeg(0, dur*env_peak, 6, 1, dur-dur*env_peak, -6, 0)
  left:a, right:a = pan2(sig*env, env_peak)   ;pan according to random value
  outs(left, right)
endin

</CsInstruments>
<CsScore>
i1 0 5
i1 4 5
i1 8 5
e
</CsScore>
</CsoundSynthesizer>
