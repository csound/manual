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
  aTone poscil p4, p5
  out aTone
endin

instr 1
  voice:Instr = play(Tone, 0.1, 440)
  self:Instr = getinstance()
  running:b = isactive(self)
  if running then
    prints "Controller is active\n"
  endif

  kTime timeinsts
  ; Pause from half a second to one second, then resume.
  kPause = (kTime >= 0.5 && kTime < 1) ? 1 : 0
  pause(voice, kPause)

  activeNow:B = isactive(voice)
  if activeNow then
    kActive = 1
  else
    kActive = 0
  endif
  printk2 kActive

  ; The instance reads its frequency from p5 during performance.
  kFrequency line 440, p3, 660
  setp(voice, 5, kFrequency)
  kAmplitude linseg 0, 0.01, 0.1, p3 - 0.02, 0.1, 0.01, 0
  setp(voice, 4, kAmplitude)

  ; play has no duration argument. The controller owns its cleanup.
  delete(voice)
endin
</CsInstruments>
<CsScore>
i 1 0 1.5
e
</CsScore>
</CsoundSynthesizer>
