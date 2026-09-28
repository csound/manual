<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

; Based on tjingboem's return/evalstr example in manual issue #315.
; Expanded here into a bell arpeggio with bass and stereo echoes.
gaLeft init 0
gaRight init 0

instr 1
  ; Each score event starts eight notes and a bass note.
  ; p4 sets the MIDI root. p5 shifts the melody up by octaves.
  schedule 3, 0, 1.9, p4 - 12
  iStep = 0
  while iStep < 8 do
    schedule 2, iStep * 0.25, 1.5, p4 + 12 * p5, iStep
    iStep += 1
  od
endin

instr 2
  ; sprintf inserts the root and step into the code string.
  ; evalstr runs this code in the global space (instrument 0).
  Scode sprintf {{
iNotes[] fillarray 0, 7, 12, 14, 19, 14, 12, 7
return cpsmidinn(%d + iNotes[%d])
}}, p4, p5
  iFreq evalstr Scode
  ; iFreq holds the value supplied by return, in Hz.
  printf_i "step %d, returned frequency %.2f Hz\n", 1, p5, iFreq

  aBodyEnv transeg 0, 0.003, 0, 0.13, p3 - 0.003, -7, 0
  aBrightEnv transeg 0, 0.002, 0, 0.055, p3 - 0.002, -12, 0
  aBody poscil aBodyEnv, iFreq
  aBright poscil aBrightEnv, iFreq * 2.01
  aLeft, aRight pan2 aBody + aBright, 0.15 + 0.1 * p5
  gaLeft += aLeft
  gaRight += aRight
endin

instr 3
  aEnv linseg 0, 0.015, 0.16, p3 - 0.215, 0.12, 0.2, 0
  aBass poscil aEnv, cpsmidinn(p4)
  gaLeft += aBass * 0.7
  gaRight += aBass * 0.7
endin

instr 99
  ; Cross the echoes between the speakers, then add reverb.
  aEchoLeft delay gaRight, 0.375
  aEchoRight delay gaLeft, 0.625
  aLeft = gaLeft + 0.4 * aEchoLeft
  aRight = gaRight + 0.4 * aEchoRight
  aRevLeft, aRevRight reverbsc aLeft, aRight, 0.82, 7000
  ; Fade the last second so the reverb ends smoothly.
  aFade linseg 1, p3 - 1, 1, 1, 0
  outs (aLeft + 0.25 * aRevLeft) * aFade, (aRight + 0.25 * aRevRight) * aFade
  clear gaLeft, gaRight
endin
</CsInstruments>
<CsScore>
; The second pass raises the melody by an octave.
i 1  0 0.01 48 0
i 1  2 0.01 44 0
i 1  4 0.01 41 0
i 1  6 0.01 43 0
i 1  8 0.01 48 1
i 1 10 0.01 44 1
i 1 12 0.01 41 1
i 1 14 0.01 43 1
; Let the last notes and reverb ring out.
i 99 0 22
e
</CsScore>
</CsoundSynthesizer>
