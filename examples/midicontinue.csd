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
  // Continue and Timing Clock have independent flags.
  kContinue = midicontinue()
  kClock = midiclockin()

  // Check every cycle, including consecutive cycles with a message.
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
