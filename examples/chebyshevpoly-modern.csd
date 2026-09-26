<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o chebyshevpoly.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2

; time-varying mixture of first six harmonics
instr 1
  ; According to the GEN13 manual entry,
  ; the pattern + - - + + - - for the signs of 
  ; the chebyshev coefficients has nice properties.

  dur:i = p3
  ; these six lines control the relative powers of the harmonics
  k1 = line(1.0, dur, 0.0)
  k2 = line(-0.5, dur, 0.0)
  k3 = line(-0.333, dur, -1.0)
  k4 = line(0.0, dur, 0.5)
  k5 = line(0.0, dur, 0.7)
  k6 = line(0.0, dur, -1.0)
 
  ; play a sine wave at a frequency of 256 Hz with amplitude = 1.0
  x:a = oscili(1, 256)

  ; waveshape it
  y:a = chebyshevpoly(x, 0, k1, k2, k3, k4, k5, k6)

  ; avoid clicks, scale final amplitude, and output
  declick:a = linseg(0.0, 0.05, 1.0, dur-0.1, 1.0, 0.05, 0.0)
  y *= declick*10000
  outs(y, y)
endin

</CsInstruments>
<CsScore>
i1 0 5
e

</CsScore>
</CsoundSynthesizer>