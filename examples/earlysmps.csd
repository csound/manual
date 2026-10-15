<CsoundSynthesizer>
<CsOptions>
-n -d -m0 --sample-accurate
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 64
nchnls = 1
0dbfs = 1

instr 1
  ; A constant signal makes the expected RMS easy to see.
  aSignal = 0.25
  kFirst = offsetsmps()
  kEarly = earlysmps()
  kEnd = ksmps - kEarly
  kCount = kEnd - kFirst

  ; Measure only the samples that belong to this note.
  kSum = 0
  kIndex = kFirst
  while kIndex < kEnd do
    kSample = vaget(kIndex, aSignal)
    kSum += kSample * kSample
    kIndex += 1
  od
  kRms = sqrt(kSum / kCount)

  if kEarly > 0 then
    printf "Final block has %d active samples and %d inactive samples\n", 1, kCount, kEarly
    printf "RMS of the active samples is %.2f\n", 1, kRms
  endif
endin
</CsInstruments>
<CsScore>
; 750 samples fill 11 blocks of 64 and 46 samples of the last block.
i 1 0 [750/48000]
e
</CsScore>
</CsoundSynthesizer>
