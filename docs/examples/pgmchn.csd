<CsoundSynthesizer>
<CsOptions>
-d -odac -M0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

; Only the score starts the monitor. Ignore MIDI notes.
massign 0, 0

instr MonitorPrograms
  ; With no filter, read Program Change messages from every channel.
  kProgram, kChannel = pgmchn()

  ; Channel 0 means no matching message on this cycle.
  if kChannel > 0 then
    printks "Channel %.0f program %.0f\n", 0, kChannel, kProgram
  endif
endin
</CsInstruments>
<CsScore>
i "MonitorPrograms" 0 30
e
</CsScore>
</CsoundSynthesizer>
