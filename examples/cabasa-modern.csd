<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o cabasa.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs =  1

instr 1 
  num:i = p4
  damp:i = p5               
  sig:a = cabasa(0.9, 0.01, num, damp)
  outs(sig, sig)
endin

</CsInstruments>
<CsScore>

i1 1 1 48   0.95
i1 + 1 1000 0.5

e

</CsScore>
</CsoundSynthesizer>