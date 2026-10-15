<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr Tone
  aTone poscil 0.1, p4
  out aTone
endin

instr 1
  definition:InstrDef = Tone
  Sname = str(definition)
  iNumber = instrnum(definition)
  Slookup = instrstr(iNumber)
  printf_i "Definition name %s\n", 1, Sname
  printf_i "Number lookup gives %s\n", 1, Slookup
  ; The typed definition can also go straight to schedule.
  schedule(definition, 0, 0.2, 440)
endin
</CsInstruments>
<CsScore>
i 1 0 0.3
e
</CsScore>
</CsoundSynthesizer>
