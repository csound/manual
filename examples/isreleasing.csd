<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  ; The envelope extends the note by 0.2 seconds for its release.
  aEnvelope linsegr 0, 0.01, 0.1, 0.2, 0
  aTone poscil aEnvelope, 440
  out aTone

  self:Instr = getinstance()
  releasing:B = isreleasing(self)
  if releasing then
    kReleasing = 1
  else
    kReleasing = 0
  endif
  printk2 kReleasing

  ; The form without an argument checks the current note too.
  kCurrent = isreleasing()
endin
</CsInstruments>
<CsScore>
i 1 0 0.5
e
</CsScore>
</CsoundSynthesizer>
