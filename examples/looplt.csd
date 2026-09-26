<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o loop_lt.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

seed 0
gisine = ftgen(0, 0, 2^10, 10, 1)

instr 1 ;master instrument
  ninstr:i = 5 ;number of called instances
  ndx:i = 0
loop:
  prints("play instance %d\\n", ndx)
  Pan:i = random(0, 1)
  freq:i = random(100, 1000)
  amp:i = 1/ninstr
  eventi("i", 10, 0, p3, amp, freq, Pan)
  looplt(ndx, 1, ninstr, loop)
endin

instr 10
  Peak:i = random(0, 1) ;where is the envelope peak
  sig:a = poscil3(p4, p5, gisine)
  env:a = transeg(0, p3*Peak, 6, 1, p3-p3*Peak, -6, 0)
  aL, aR = pan2(sig*env, p6)
  out(aL, aR)
endin

</CsInstruments>
<CsScore>
i1 0 10
e
</CsScore>
</CsoundSynthesizer>