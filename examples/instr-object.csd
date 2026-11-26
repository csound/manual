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
  ; A manual instance receives these values through init and perf.
  aTone poscil p4, p5
  out aTone
endin

instr 1
  ; Tone is an InstrDef. voice is one instance of that definition.
  voice:Instr = create(Tone)
  iStatus = init(voice, 0, 440)
  if iStatus != 0 then
    exitnow -1
  endif

  kAmplitude linseg 0, 0.01, 0.1, p3 - 0.02, 0.1, 0.01, 0
  kFrequency line 440, p3, 660
  ; Run one control block of the child, passing new p4 and p5 values.
  kStatus = perf(voice, kAmplitude, kFrequency)

  ; Free the instance when this containing note ends.
  delete(voice)
endin
</CsInstruments>
<CsScore>
i 1 0 1
e
</CsScore>
</CsoundSynthesizer>
