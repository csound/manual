<CsoundSynthesizer>
<CsOptions>
-d -odac -M0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

; Ignore MIDI notes. The score starts the transport listener.
massign 0, 0

instr Listen
  kStart = midistart()
  if kStart == 1 then
    ; Schedule one short cue for each detected Start.
    event("i", "Cue", 0, 0.1)
  endif
endin

instr Cue
  prints "MIDI Start received\n"
  aEnvelope = linseg(0, 0.005, 0.2, 0.095, 0)
  aTone = oscili(aEnvelope, 880)
  out(aTone)
endin
</CsInstruments>
<CsScore>
i "Listen" 0 60
</CsScore>
</CsoundSynthesizer>
