<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac    ;;;RT audio I/O
; For non-realtime output leave only the line below:
; -o swtset.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  iN = 512
  iFamily = 1          ; Daubechies
  iOrder = 4
  iLevels = 4

  aInput = 0.2 * oscili(1, 220) + 0.05 * oscili(1, 1800)
  wIn:swt swtanal aInput, iN, iN, iFamily, iOrder, iLevels, 0, 0, 1

  kApprox:k[] swtget wIn, 0              ; read the approximation band
  kZeros:k[] init 512
  wDetails:swt swtset wIn, kZeros, 0     ; remove it from a copy

  aOut = swtsynth(wDetails)
  out aOut
endin

</CsInstruments>
<CsScore>
i 1 0 3
e
</CsScore>
</CsoundSynthesizer>
