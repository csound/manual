<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o butterlp.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs =  1

instr 1 ; White noise signal
  sig:a = rand(0.5)
  outs(sig, sig)
endin

instr 2 ; filtered noise
  sig:a = rand(0.7)
  lp:a = butterlp(sig, 1000)    ;cutting frequencies above 1 KHz
  outs(lp, lp)
endin

</CsInstruments>
<CsScore>

i 1 0 2
i 2 2.5 2
e

</CsScore>
</CsoundSynthesizer>