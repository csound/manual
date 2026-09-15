<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o bbcuts.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; by Menno Knevel 2022

instr 1 ;Play an audio file
  left:a, right:a = diskin2("drumsSlp.wav", 1, 0)
  outs(left, right)
endin

instr 2 ;Cut-up stereo audio file.
  bps:i = 16
  subdiv:i = p4
  barlength:i = 2
  phrasebars:i = 1
  numrepeats:i = 8

  left:a, right:a = diskin2("drumsSlp.wav", 1, 0)
  left, right = bbcuts(left, right, bps, subdiv, barlength, phrasebars, numrepeats)
  outs(left, right)
endin

</CsInstruments>
<CsScore>

i1 0  4         ; original sample
i2 5  4 1       ; subdivisions = 1
i2 10 4 .5      ; subdivisions = .5
e

</CsScore>
</CsoundSynthesizer>