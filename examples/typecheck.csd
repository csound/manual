<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  iNote = 60
  iOtherNote = 72
  kNote init 60
  iNotes[] fillarray 60, 64, 67
  SNames[] fillarray "C", "E", "G"

  ; Different values can have the same type.
  sameType:b = typecheck(iNote, iOtherNote)
  if sameType then
    prints "Both note values are i-rate\n"
  endif

  ; Equal values can have different types.
  if typecheck(iNote, kNote) then
    prints "The note types match\n"
  else
    prints "The i-rate and k-rate notes have different types\n"
  endif

  ; Array element types are not part of this comparison.
  if typecheck(iNotes, SNames) then
    prints "Both arguments are arrays\n"
  endif
endin
</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>
