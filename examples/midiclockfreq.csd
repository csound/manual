<CsoundSynthesizer>
<CsOptions>
-d -odac -M0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 16
nchnls = 1
0dbfs = 1

// Incoming notes should not start extra copies of the clock reader.
massign 0, 0

instr ClockTempo
  kFrequency = midiclockfreq()
  kPulse = midiclockin()

  // midiclockin returns 1 when Csound detects a clock pulse, otherwise 0.
  kPulseCount init 0
  kPulseCount += kPulse

  // MIDI sends 24 clock pulses per quarter note. Print once per quarter.
  if kPulseCount >= 24 then
    kBpm = kFrequency * 60 / 24
    printks "Clock %.2f Hz, tempo %.1f BPM\n", 0, kFrequency, kBpm
    kPulseCount = 0
  endif
endin
</CsInstruments>
<CsScore>
i "ClockTempo" 0 30
e
</CsScore>
</CsoundSynthesizer>
