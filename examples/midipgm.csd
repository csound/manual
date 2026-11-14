<CsoundSynthesizer>
<CsOptions>
-d -odac -M0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

; Send notes on every MIDI channel to instrument 1.
massign 0, 1
; Keep that assignment when a Program Change arrives.
pgmassign 0, 0

giSine = ftgen(0, 0, 4096, 10, 1)
giBright = ftgen(0, 0, 4096, 10, 1, 0.5, 0.25)

instr 1
  ; Read the program on the channel that started this note.
  iProgram = midipgm()
  iWave = giSine
  if iProgram == 2 then
    iWave = giBright
  endif
  prints "Program %d\n", iProgram

  iFrequency = cpsmidi()
  iAmplitude = ampmidi(0.2)
  aEnvelope = madsr(0.01, 0.1, 0.7, 0.15)
  aTone = oscili(iAmplitude, iFrequency, iWave)
  out(aTone * aEnvelope)
endin
</CsInstruments>
<CsScore>
f 0 60
</CsScore>
</CsoundSynthesizer>
