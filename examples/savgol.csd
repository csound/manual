<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 480
nchnls = 1
0dbfs = 1

; With ksmps = 480 there are 100 control periods per second.
; The input is the parabola t^2 plus a jitter of +-0.05 that flips sign at
; every control period. savgol fits a parabola to each window of 11 values,
; so it removes the jitter and returns the parabola itself, together with
; its slope. Both come out (11 - 1) / 2 = 5 control periods late.

instr 1
  t:k = timeinsts()
  flip:k init 1
  flip = -flip
  x:k = t * t + 0.05 * flip

  smooth:k = savgol(x, 11, 2)
  ; derivative 1, with delta = 1/kr so that the slope is per second
  slope:k = savgol(x, 11, 2, 1, 1/kr)

  ; what the parabola and its slope were 5 control periods ago
  lag:k = t - 5/kr
  if metro(4) == 1 then
    printks("t=%4.2f  in=%6.3f  smooth=%6.3f (%6.3f)  slope=%6.3f (%6.3f)\n", 0, \
            t, x, smooth, lag * lag, slope, 2 * lag)
  endif
endin
</CsInstruments>
<CsScore>
i 1 0 2
e
</CsScore>
</CsoundSynthesizer>
