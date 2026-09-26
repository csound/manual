<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    No messages
-odac   -d
; -iadc     -d     ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o biquad.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
kr =  4410
ksmps = 10
nchnls = 2

; Instrument #1.
instr 1
  ; Get the values from the score.
  dur:i = p3
  amp:i = p4
  cps:i = cpspch(p5)
  fco:k = p6
  rez:k = p7

  ; Calculate the biquadratic filter's coefficients 
  fcon:k = 2*3.14159265*fco/sr
  alpha:k = 1-2*rez*cos(fcon)*cos(fcon)+rez*rez*cos(2*fcon)
  beta:k = rez*rez*sin(2*fcon)-2*rez*cos(fcon)*sin(fcon)
  gama:k = 1+cos(fcon)
  m1:k = alpha*gama+beta*sin(fcon)
  m2:k = alpha*gama-beta*sin(fcon)
  den:k = sqrt(m1*m1+m2*m2)
  b0:k = 1.5*(alpha*alpha+beta*beta)/den
  b1:k = b0
  b2:k = 0
  a0:k = 1
  a1:k = -2*rez*cos(fcon)
  a2:k = rez*rez
  
  ; Generate an input signal.
  xn:a = vco(1, cps, 1)

  ; Filter the input signal.
  yn:a = biquad(xn, b0, b1, b2, a0, a1, a2)
  yn *= amp/2
  outs(yn, yn)
endin

</CsInstruments>
<CsScore>

; Table #1, a sine wave.
f 1 0 16384 10 1

;    Sta  Dur  Amp    Pitch Fco   Rez
i 1  0.0  1.0  20000  6.00  1000  .8
i 1  1.0  1.0  20000  6.03  2000  .95
e

</CsScore>
</CsoundSynthesizer>