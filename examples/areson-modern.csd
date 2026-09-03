<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o areson.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs =  1

instr 1 ; unfiltered noise
  sig:a = rand(0.5)           ; white noise signal.
     out(sig, sig)
endin

instr 2 ; filtered noise
  cf:k = init(1000)
  bw:k = init(100)
  sig:a = rand(0.5)
  fil:a = areson(sig, cf, bw)
  fil = balance(fil, sig)     ; fil = very loud
  outs(fil, fil)
endin

</CsInstruments>
<CsScore>

i 1 0 2
i 2 2 2
e

</CsScore>
</CsoundSynthesizer>