<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o comb.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs =  1

mix@global:a = init(0)

instr 1 
  cps:k = expon(p5, p3, p4)
  sig:a = vco2(0.3, cps)
  outs(sig, sig) 
  mix += sig 
endin

instr 99 
  rvt:k = 3.5
  lpt:i = 0.1
  left:a = comb(mix, rvt, lpt)
  right:a = comb(mix, rvt, lpt*0.2)
  outs(left, right)
  clear(mix)     ; clear mixer
endin

</CsInstruments>
<CsScore>

i 1 0  3   20  2000
i 1 5 0.01 440 440

i 99 0 8
e

</CsScore>
</CsoundSynthesizer>