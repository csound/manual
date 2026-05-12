<CsoundSynthesizer>
<CsOptions>
-odac -Mhw:1,0,0
</CsOptions>

<CsInstruments>

cnt@global:i = cntcreate(1)     ; a toggle
cntNote@global:i = cntcreate(1) ; ignore note-off message to turn MIDI notes into toggles

instr 1
  key:k = sensekey()
  note:i = notnum()

  if key == 97 then
    k1 = count(cnt)
    if k1 == 0 then
      event("i", 2, 0, -1)
    else
      event("d", 2, 0, -1)
    endif
  endif

  print(note)
  if note == 60 then
    i2 = count_i(cntNote)
    print(i2)
    if i2 == 0 then
      eventi("i", 3, 0, -1)
    else
      eventi("d", 3, 0, -1)
    endif
  endif
endin

instr 2
  out(poscil(10000, 440))
endin

instr 3
  out(poscil(5000, 880))
endin

</CsInstruments>

<CsScore>
i1 0 z
e
</CsScore>

</CsoundSynthesizer>