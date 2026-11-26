<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o loop_gt.wav -W ;;; for file output any platform

; By Stefano Cucchi - 2021

</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

saw@global:i = ftgen(3, 0, 16384, 10, 0, 0.2, 0, 0.4, 0, 0.6, 0, 0.8, 0, 1, \
                     0, 0.8, 0, 0.6, 0, 0.4, 0, 0.2)

instr 1 ;master instrument
  ndxFreq:i = p5
loop:
  freq:i = p4 + ndxFreq
  print(freq)
  amp:i = 0.5/((p5-p7)/p6)
  eventi("i", 10, 0, p3, amp, freq)
  loopgt(ndxFreq, p6, p7, loop)
endin

instr 10
  sig:a = oscili(p4, p5, saw)
  sig = butterhp(sig, 50)
  declick:k =linseg(0, 0.1, 1, p3-0.2, 1, 0.1, 0)
  out(sig * declick, sig * declick)
endin

</CsInstruments>
<CsScore>

i1 0 2 200 10 3 1
i1 2 2 200 4 0.3 1
i1 4 2 200 55 7 1
i1 6 2 200 3 0.2 1

e
</CsScore>
</CsoundSynthesizer>