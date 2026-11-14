<CsoundSynthesizer>
<CsOptions>
-odac -d -m1
</CsOptions>
<CsInstruments>
;example by joachim heintz (& Menno Knevel)
sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

;ATSA wants a mono file!
;only 1 cycle and small hop size
res:i = systemi(1, {{ atsa -h.1 -c1 fox.wav fox.ats }})

instr AllTheNoise
  file:S = "fox.ats"
  prints("Resynthesizing with all the noise.\n")
  Dur:i = atsinfo(file, 7)
  p3 = Dur
  time:k = line(0, Dur, Dur)
  sig:a = atsaddnz(time, file, 25)
  out(sig, sig)
  ;start next instr
  eventi("i", "NoiseInBandsOfFive", Dur+1, 1, 0)
endin

instr NoiseInBandsOfFive
  file:S = "fox.ats"
  prints("Resynthesizing with noise bands %d - %d.\n", p4, p4+5)
  Dur:i = atsinfo(file, 7)
  p3 = Dur
  time:k = line(0, Dur, Dur)
  sig:a = atsaddnz(time, file, 5, p4)
  out(sig, sig)
  ;start next instr
  if p4 < 20 then
    eventi("i", "NoiseInBandsOfFive", Dur+1, 1, p4+5)
  endif
endin
</CsInstruments>

<CsScore>
i "AllTheNoise" 0 1
e 25
</CsScore>
</CsoundSynthesizer>