<CsoundSynthesizer>
<CsOptions>
-odac -d -m1
</CsOptions>
<CsInstruments>
;example by joachim heintz (& Menno Knevel)
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

;ATSA wants a mono file!
res:i = systemi(1, {{ atsa -h.1 -c2 fox.wav fox.ats }}) ; only 2 cycles and small hop size

Sine@global:i = ftgen(0, 0, 1024, 10, 1)

instr AllTheTones
  file:S = "fox.ats"
  prints("Resynthesizing with all the tones.\n")
  Dur:i = atsinfo(file, 7)
  p3 = Dur
  NumParts:i = atsinfo(file, 3)
  prints("Overall number of partials = %d\n", NumParts)
  time:k = line(0, Dur, Dur)
  sig:a = atsadd(time, 1, file, Sine, NumParts)
  out(sig, sig)
  ;start next instr
  eventi("i", "TonesInBandsOfTen", Dur+1, Dur, 0, NumParts)
endin

instr TonesInBandsOfTen
  file:S = "fox.ats"
  Offset:i = p4   ;start at this partial
  NumParts:i = p5 ;overall number of partials
  prints("Resynthesizing with partials %d - %d.\n", Offset+1, Offset+10)
  time:k = line(0, p3, p3)
  sig:a = atsadd(time, 1, file, Sine, 10, Offset)
  out(sig, sig)
  ;start next instance until there are enough partials left
  if Offset+20 < NumParts then
    eventi("i", "TonesInBandsOfTen", p3+1, p3, Offset+10, NumParts)
  else
    eventi("i", "End", p3, 1)
  endif
endin

instr End
  exitnow()
endin
</CsInstruments>

<CsScore>
i "AllTheTones" 0 1
e 999
</CsScore>
</CsoundSynthesizer>