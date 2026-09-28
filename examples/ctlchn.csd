<CsoundSynthesizer>
<CsOptions>
-d -odac -M0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

// Only the score starts the monitor. MIDI notes should not start it again.
massign 0, 0

instr MonitorControllers
  // With no filters, read controller messages from every channel.
  kValue, kController, kChannel = ctlchn()

  // Channel 0 means no matching message. A value of 0 is a real message.
  if kChannel > 0 then
    printks "Channel %.0f controller %.0f value %.0f\n", 0, kChannel, kController, kValue
  endif
endin
</CsInstruments>
<CsScore>
i "MonitorControllers" 0 30
e
</CsScore>
</CsoundSynthesizer>
