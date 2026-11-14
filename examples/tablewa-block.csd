<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

; Based on the table-processing examples by Robin Whittle.
giBlock ftgen 0, 0, ksmps, -2, 0

instr 1
  aInput poscil 0.4, 440
  ; The buffer holds exactly one audio block.
  kNext tablewa giBlock, aInput, 0

  kIndex = 0
  while kIndex < ksmps do
    kValue table kIndex, giBlock
    ; Apply a relative gain to each sample.
    tablew kValue * 0.5, kIndex, giBlock
    kIndex += 1
  od

  aOutput tablera giBlock, 0, 0
  out aOutput
endin
</CsInstruments>
<CsScore>
i 1 0 2
e
</CsScore>
</CsoundSynthesizer>
