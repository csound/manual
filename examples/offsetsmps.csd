<CsoundSynthesizer>
<CsOptions>
-odac -d -m0 --sample-accurate
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 64
nchnls = 1
0dbfs = 1

instr 1
  aTone = 0
  kPhase init 0
  kFirst = offsetsmps()
  kEnd = ksmps - earlysmps()
  printk2 kFirst

  ; Leave the inactive samples before and after the note at zero.
  kIndex = kFirst
  while kIndex < kEnd do
    kSample = 0.1 * sin(2 * $M_PI * kPhase)
    vaset(kSample, kIndex, aTone)

    ; Advance the oscillator only for samples that belong to the note.
    kPhase = frac(kPhase + 440 / sr)
    kIndex += 1
  od
  out aTone
endin
</CsInstruments>
<CsScore>
; Start at sample 375, which is 55 samples into a 64-sample block.
i 1 [375/48000] 0.125
e
</CsScore>
</CsoundSynthesizer>
