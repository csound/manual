<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
-d        ;;;no display
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o abs.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2

instr 1
  x:i = p4
  iabs = abs(x)
  print(iabs)
endin

</CsInstruments>
<CsScore>

i 1 0 1 0
i 1 + 1 -0.15
i 1 + 1 -13
e

</CsScore>
</CsoundSynthesizer>