<CsoundSynthesizer>
<CsOptions>
-odac -d -m128
</CsOptions>
<CsInstruments>
;example by joachim heintz (& Menno Knevel)
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

ires = system_i(1, {{ atsa fox.wav fox.ats }}) ; default settings

file@global:S = "fox.ats"
NumParts@global:i = ATSinfo(file, 3) ;overall number of partials
Dur@global:i = ATSinfo(file, 7)      ;duration 
seed(0)

instr PlayList
  event_i("i", "PlayAll", 0,       1, 1,   0,   0.5) ;sine only, half speed
  event_i("i", "PlayAll", Dur*2+1, 1, 0,   1,   0.5) ;noise only
  event_i("i", "PlayAll", Dur*4+2, 1, 0.5, 0.5, 0.5) ;half sine, half noise
endin

instr PlayAll
  SinAmnt:i = p4 ;sinee amount (0-1)
  NzAmnt:i  = p5 ;noise amount (0-1)
  Speed:i   = p6 ;speed
  p3        = Dur/Speed
  time:k = line(0, Dur/Speed, Dur)
  prints("Resynthesizing all partials with tone = %.1f and noise = %.1f.\n", \
         SinAmnt, NzAmnt)
  Out:a = ATSsinnoi(time, SinAmnt, NzAmnt, 1, file, NumParts)
  outs(Out, Out)
endin

instr PlayBand
  Offset:i = p4 ;offset in partials
  Speed:i  = p5 ;speed
  p3       = Dur/Speed
  time:k = line(0, Dur/Speed, Dur)
  prints("Resynthesizing partials %d to %d with related noise.\n", \
         Offset+1, Offset+10)
  Out:a = ATSsinnoi(time, 1, 0.3, 1, file, 10, Offset, 1) ; a bit less noise (0.3)
  outs(Out*2, Out)    ; left channel a bit louder
  ;call itself again
  if Offset < NumParts - 20 then
    event_i("i", "PlayBand", Dur/Speed+1, 1, Offset+10, Speed)
  endif
endin

instr PlayWeighted
  ;sine amount, noise amount and speeed are varying
  SinAmnt:k = randomi(0, 1, 1, 3)
  NzAmnt:k = 1 - SinAmnt
  Speed:k = randomi(0.01, 0.3, 1, 3)
  sync:a = init(0)
  time:a, end:a = syncphasor(Speed/Dur, sync)
  Trig:k = metro(100)
  End:k = max_k(end, Trig, 1) ;1 if phasor signal crosses zero
  Time:k = downsamp(time)
  Out:a = ATSsinnoi(Time*Dur, SinAmnt, NzAmnt, 1, file, NumParts)
  outs(Out*0.6, Out)   ; pan a bit to the right
  ;exit if file is at the end
  if End == 1 then
    event("e", 0, 0)
  endif
endin
</CsInstruments>

<CsScore>
i "PlayList" 0 1
i "PlayBand" 20 1 0 .5
i "PlayWeighted" 110 100
</CsScore>
</CsoundSynthesizer>