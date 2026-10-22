<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  -d   ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o buzz.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs =  1

instr 1
  cps:k = 110
  fn:i  = 1

  nh:k = line(p4, p3, p5)
  sig:a = buzz(1, cps, nh, fn)
  outs(sig, sig)
endin

</CsInstruments>
<CsScore>

;sine wave.
f 1 0 16384 10 1

i 1 0 3 20 20
i 1 + 3 3  3
i 1 + 3 10 1
e

</CsScore>
</CsoundSynthesizer>
