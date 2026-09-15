<CsoundSynthesizer>
<CsOptions>
-odac       ;   
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32

; by tgrey 2020
instr 1
  LoopStart:i = p4
  LoopEnd:i   = p5
  Offset:i    = p6

  Count:i = init(LoopStart)

  if LoopStart < LoopEnd then            ; loop going up
    while Count <= LoopEnd do
      Val:i = Count + Offset
      Round:i = round(Val)
      Int:i = int(Val)
      Floor:i = floor(Val)
      Ceil:i = ceil(Val)
      print(Val, Round, Int, Floor, Ceil)
      Count += 1             
    od
  elseif LoopEnd < LoopStart then        ; loop going down
    while Count >= LoopEnd do
      Val = Count + Offset
      Round = round(Val)
      Int = int(Val)
      Floor = floor(Val)
      Ceil = ceil(Val)
      print(Val, Round, Int, Floor, Ceil)
      Count -= 1             
    od
  endif
endin
</CsInstruments>
<CsScore>
i1 0   0.1 0  10 0.5
i1 0.2  .1 0 -10 0.5
e
</CsScore>
</CsoundSynthesizer>