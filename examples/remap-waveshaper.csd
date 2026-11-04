<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o remap-waveshaper.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

; remap with an audio input is a waveshaper: every sample goes through the
; transfer curve drawn by the breakpoints. The curve below is a soft
; saturation that never exceeds 0.8. The drive rises during the note, so the
; sine is pushed further and further into the knee.

instr 1
  mode:i = p4
  prints(mode == 0 ? "linear transfer curve\n" : "cubic transfer curve\n")

  ; input level -> output level
  curvex:i[] = fillarray(-1, -0.5, 0, 0.5, 1)
  curvey:i[] = fillarray(-0.8, -0.6, 0, 0.6, 0.8)

  drive:k = expseg(0.1, p3, 4)
  sig:a = poscil(drive, 110)

  ; bounds 1 clamp: past +-1 the output holds at +-0.8
  shaped:a = remap(sig, curvex, curvey, mode, 1)

  env:k = linseg(0, 0.05, 1, p3 - 0.15, 1, 0.1, 0)
  shaped *= 0.3 * env
  out(shaped, shaped)
endin
</CsInstruments>
<CsScore>
; p4 = interpolation mode
i 1 0   4 0  ; linear: corners at every breakpoint, brighter
i 1 4.5 4 4  ; cubic: the same curve with rounded corners, smoother
e
</CsScore>
</CsoundSynthesizer>
