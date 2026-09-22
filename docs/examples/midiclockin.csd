<CsoundSynthesizer>
<CsOptions>
-d -odac -M0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 16
nchnls = 1
0dbfs = 1

// MIDI notes should not start extra copies of the clock reader.
massign 0, 0

instr ClockBeats
  kPulse = midiclockin()
  kPulseCount init 0
  kBeatCount init 0

  // Add each cycle's pulse flag, even on consecutive cycles.
  kPulseCount += kPulse
  if kPulseCount >= 24 then
    kPulseCount = 0
    kBeatCount += 1
    printks "Quarter note %.0f\n", 0, kBeatCount
    event("i", "Click", 0, 0.03)
  endif
endin

instr Click
  aEnvelope = expon(0.15, p3, 0.0001)
  aClick = oscili(aEnvelope, 1000)
  out(aClick)
endin
</CsInstruments>
<CsScore>
i "ClockBeats" 0 30
e
</CsScore>
</CsoundSynthesizer>
