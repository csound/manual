<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
-d        ;;;no display
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o alpass.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr  = 44100
ksmps = 100
nchnls  = 2
0dbfs   = 1

mix@global:a init 0 

instr 1 
  cps:a = expon(p4, p3, p5)
  sig:a = vco(0.6, cps, 1)
  outs(sig, sig) 

  mix += sig 
endin

instr 99
  dur:i = p3

  rvt1:a = line(3.5*1.5, dur, 6)
  rvt2:a = line(3.5, dur, 4)
  lpt:i =  0.1
  left:a = alpass(mix, rvt1, lpt)
  right:a = alpass(mix, rvt2, lpt*2)
  outs(left, right)

  mix = 0       ; clear mixer
endin

</CsInstruments>
<CsScore>
f1 0 4096 10 1
i 1 0 3 20 2000

i 99 0 8
e

</CsScore>
</CsoundSynthesizer>