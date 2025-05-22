<CsoundSynthesizer>
<CsOptions>
-odac -d -m128
</CsOptions>
<CsInstruments>
;example by joachim heintz
sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

ires1 = system_i(1, {{ atsa fox.wav fox.ats }}) ; default settings

Sine@global:i = ftgen(0, 0, 1024, 10, 1)
file@global:S = "fox.ats"
NumParts@global:i = ATSinfo(file, 3) ;overall number of partials
Dur@global:i = ATSinfo(file, 7)      ;duration 
seed(0)

instr ReadOnePartial
  Partial:i = p4
  p3 = Dur
  time:k = line(0, Dur, Dur)
  prints("Resynthesizing partial number %d.\n", Partial)
  Frq:k, Amp:k = ATSread(time, file, Partial)
  Amp = port(Amp, 0.1) ;smooth amplitudes - still not satisfactoring
  Out:a = poscil(Amp, Frq, Sine)
  Out = linen(Out, 0, p3, 0.01) ;anti-click
  outs(Out*10, Out*10)
  ;start next instr: normal speed, three loops, pause between loops one second
  event_i("i", "MasterRand", Dur+3, 1, 1, 3, 2)
endin

instr MasterRand
  ;random selections of 10 partials per second, overlapping
  Speed:i    = p4 ;speed of reading / playing
  NumLoops:i = p5 ;number of loops
  Pause:i    = p6 ;length of pause between loops
  prints("Resynthesizing random partials.\n")
  p3 = (Dur/Speed+Pause) * NumLoops
  ;start next instr: half speed, three loops, three seonds pause between loops
  event_i("i", "MasterArp", p3+3, 1, 0.5, 3, 3)
  ;loop over duration plus pause
  loop:
    timout(0, Dur/Speed+Pause, play)
    reinit(loop)
  play:
  Time@global:k = line(0, Dur/Speed, Dur) ;start time from 0 in each loop
  Trig:k = metro(10) ;10 new partials per second
  ;call subinstrument if trigger and no pause
  if Trig == 1 && Time < Dur then
    Part:k = random(1, NumParts + 0.999)
    event("i", "PlayRand", 0, 1, int(Part))
  endif
endin
  
instr MasterArp
  ;argeggio-like reading and playing of partials 
  Speed:i    = p4 ;speed of reading / playing
  NumLoops:i = p5 ;number of loops
  Pause:i    = p6 ;length of pause between loops
  prints("Arpeggiating partials.\n")
  p3 = (Dur/Speed+Pause) * NumLoops
  loop:
    timout(0, Dur/Speed+Pause, play)
    reinit(loop)
  play:
  Time = line(0, Dur/Speed, Dur)
  Arp:k = linseg(1, (Dur/Speed)/2, NumParts, (Dur/Speed)/2, 1) ;arp up and down
  Trig:k = metro(10) ;10 new partials per second
  if Trig == 1 && Time < Dur then
    event("i", "PlayArp", 0, 5, int(Arp))
  endif
  ;exit csound when finished
    event_i("i", "End", p3+5, 1)
endin

instr PlayRand
  Partial:i = p4
  Frq:k, Amp:k = ATSread(Time, file, Partial)
  amp:k = port(Amp, 0.15) ;smooth amplitudes
  Out:a = poscil(Amp, Frq, Sine)
  Out = linen(Out, 0.01, p3, 0.01)
  outs(Out, Out)
endin

instr PlayArp
  Count:k = init(1) ;k-cycle
  Partial:i = p4
  Frq:k, Amp:k = ATSread(Time, file, Partial)
  if Count == 1 then ;get freq from first k-cycle
    ModFq:k = Frq
    ;avoid to go with 0 Hz as this blocks the mode filter
    if ModFq == 0 then
      turnoff()
    endif
  endif
  Vol:i = random(-42, -12) ;db
  Offset:i = random(0.01, 0.1) ;no too regularily ...
  Imp:a = mpulse(ampdb(Vol), p3, Offset)
  Q:i = random(500, 5000)
  Out:a = mode(Imp, ModFq, Q)
  Out = linen(Out, 0, p3, p3/3)
  outs(Out, Out)
  Count = 2
endin

instr End
  exitnow()
endin
</CsInstruments>

<CsScore>
i "ReadOnePartial" 0 1 10
e 999
</CsScore>
</CsoundSynthesizer>