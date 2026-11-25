<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac    ;;;RT audio I/O
; For non-realtime output leave only the line below:
; -o swtanal.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  iN = 512
  iH = 128
  iFamily = 1          ; Daubechies
  iOrder = 4
  iLevels = 4
  iBoundary = 0        ; periodic
  iWindow = 1          ; square-root Hann
  iOla = 2             ; overlap-add

  aInput = 0.2 * oscili(1, 440) + 0.05
  wIn:swt swtanal aInput, iN, iH, iFamily, iOrder, iLevels, iBoundary, iWindow, iOla
  aOut = swtsynth(wIn)
  out aOut
endin

</CsInstruments>
<CsScore>
i 1 0 3
e
</CsScore>
</CsoundSynthesizer>
