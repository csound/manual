<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  -d    ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o ceil-2.wav -W ;;; for file output any platform

; By Stefano Cucchi - 2020

</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
  dur:i = p3
  cps:k = 100
  car:k = 1
  mod:k = p4

  ndx:k = poscil(30, 0.25/dur, 1)
  ndx = ceil(ndx)

  sig:a = foscili(0.5, cps, car, mod, ndx, 1)
  outs(sig, sig)
endin
</CsInstruments>
<CsScore>

f 1 0 16384 10 1

i 1 0 10 1.5    
e
</CsScore>
</CsoundSynthesizer>