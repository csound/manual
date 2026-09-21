<CsoundSynthesizer>
<CsOptions>
-d -odac -M0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 16
nchnls = 1
0dbfs = 1

; Ignore MIDI notes while checking transport messages.
massign 0, 0

instr CheckStop
  ; The affected implementation reads the clock field for both opcodes.
  kStop = midistop()
  kClock = midiclockin()

  ; Show the flags without using them to stop playback.
  if kStop != 0 || kClock != 0 then
    printks "Reported stop %.0f, clock %.0f\n", 0, kStop, kClock
  endif
endin
</CsInstruments>
<CsScore>
i "CheckStop" 0 30
e
</CsScore>
</CsoundSynthesizer>
