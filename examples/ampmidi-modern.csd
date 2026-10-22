<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  -M hw:1,0   ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
;-o ampmidi.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs =  1

instr 1  ;expects MIDI note inputs on channel 1
  amp:i = ampmidi(1)       ; scale amplitude between 0 and 1
  sig:a = poscil(amp, 220)
  print(amp)
  outs(sig, sig)
endin

</CsInstruments>
<CsScore>
;Dummy f-table for 1 minute
f 0 60

e

</CsScore>
</CsoundSynthesizer>