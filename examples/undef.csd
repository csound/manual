<CsoundSynthesizer>
<CsOptions>
-odac
; For file output, replace -odac with -o undef.wav -W.
</CsOptions>
<CsInstruments>
; Adapted from the example by tgrey1 in csound/manual issue #207.
; https://github.com/csound/manual/issues/207
sr = 44100
ksmps = 10
nchnls = 2
0dbfs = 1

#define FREQ1 #440#
#define FREQ2 #660#

instr 1
  ; Csound reads this before it reads instrument 2.
  ; It removes FREQ2 during preprocessing, before any notes play.
  ; Comment out this line to make instrument 2 use 660 Hz instead.
#undef FREQ2
  iFreq = $FREQ1
  prints "Instrument %g uses %g Hz\n", p1, iFreq
  a1 vco2 0.25, iFreq
  out a1, a1
endin

instr 2
  ; FREQ2 is already undefined, so Csound keeps the #else branch.
#ifdef FREQ2
  iFreq = $FREQ2
#else
  iFreq = $FREQ1
#endif
  prints "Instrument %g uses %g Hz\n", p1, iFreq
  a1 vco2 0.25, iFreq
  out a1, a1
endin
</CsInstruments>
<CsScore>
; Instrument 2 plays first, but both notes use 440 Hz.
; Score order does not change the order of macro processing.
i2 0 2
i1 2 2
e
</CsScore>
</CsoundSynthesizer>
