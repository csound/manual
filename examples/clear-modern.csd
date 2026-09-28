<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o clear.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

Reverb@global:a = init(0)

instr 1
  dur:i = p3
  pch:k = p4
  a1 = 0.5*diskin2:a("fox.wav", pch)
  vincr(Reverb, a1)
endin

instr 99 ; global reverb
  al, ar = reverbsc(Reverb, Reverb, 0.8, 10000)
  outs(Reverb+al, Reverb+ar)
  clear(Reverb)
endin

</CsInstruments>
<CsScore>

i1  0 3 1
i99 0 5
e

</CsScore>
</CsoundSynthesizer>