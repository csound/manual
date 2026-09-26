<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o changed.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2

instr 1
  kint  = int(oscil:k(2, 0.5))
  trig:k = changed(kint)
  printk(0.2, kint)
  printk2(trig)
endin

</CsInstruments>
<CsScore>
i 1 0 20

e
</CsScore>
</CsoundSynthesizer>