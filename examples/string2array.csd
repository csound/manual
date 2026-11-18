<CsoundSynthesizer>
<CsOptions>
-d -o dac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr Phrase
  // p4 supplies pitch steps as text, separated by spaces or commas.
  SSteps = strget(p4)
  iSteps[] = string2array(SSteps)

  // Read the array once and schedule a note for each step.
  iIndex = 0
  while iIndex < lenarray(iSteps) do
    iStart = iIndex * 0.4
    iMidiNote = 60 + iSteps[iIndex]
    schedule("Tone", iStart, 0.35, iMidiNote)
    iIndex += 1
  od
endin

instr Tone
  iFrequency = cpsmidinn(p4)
  aEnvelope = linen(0.2, 0.01, p3, 0.05)
  aTone = oscili(aEnvelope, iFrequency)
  out(aTone)
endin
</CsInstruments>
<CsScore>
// Major, then minor. Both separator styles work.
i "Phrase" 0 0.01 "0, 4, 7, 12"
i "Phrase" 2 0.01 "0 3 7 12"
// Allow the last scheduled notes to finish.
f 0 4
e
</CsScore>
</CsoundSynthesizer>
