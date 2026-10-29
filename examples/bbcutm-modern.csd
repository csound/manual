<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    No messages
-odac             ;;;RT audio out
; For Non-realtime ouput leave only the line below:
; -o bbcutm.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; additions by Menno Knevel 2021

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1     ; Play an audio file normally.
  source:a = soundin("drumsMlp.wav")
  outs(source, source)
endin

instr 2     ; Cut-up an audio file
  bps:i = 4
  subdiv:i = 8
  barlength:i = 4
  phrasebars:i = 1
  numrepeats:i = p4
  source:a = diskin2("drumsMlp.wav", 1, 0 ,1)
  a1 = bbcutm(source, bps, subdiv, barlength, phrasebars, numrepeats)
  outs(a1, a1)
endin

</CsInstruments>
<CsScore>

i 1 0 2
;       repeats
i 2 3 8     2
i 2 12 8    6
e
</CsScore>
</CsoundSynthesizer>