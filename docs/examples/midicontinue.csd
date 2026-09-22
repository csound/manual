<CsoundSynthesizer>
<CsOptions>
-d -odac -M0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 16
nchnls = 1
0dbfs = 1

massign 0, 0

instr CheckContinue
  // The affected implementation reads the clock field for both opcodes.
  kContinue = midicontinue()
  kClock = midiclockin()

  // Print the returned flags. Do not use them to control playback here.
  if kContinue != 0 || kClock != 0 then
    printks "Reported continue %.0f, clock %.0f\n", 0, kContinue, kClock
  endif
endin
</CsInstruments>
<CsScore>
i "CheckContinue" 0 30
e
</CsScore>
</CsoundSynthesizer>
