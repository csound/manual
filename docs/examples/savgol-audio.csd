<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o savgol-audio.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

; savgol as an audio lowpass. A sawtooth is played through windows of
; different sizes and polynomial orders. A longer window removes more of the
; high end; for the same window, a higher order keeps more of it.
; Order 0 is a plain moving average.

instr 1
  winsize:i = p4
  order:i = p5
  prints("winsize %d, order %d\n", winsize, order)

  saw:a = vco2(0.3, 110)
  sig:a = savgol(saw, winsize, order)

  env:k = linseg(0, 0.02, 1, p3 - 0.1, 1, 0.08, 0)
  sig *= env
  out(sig, sig)
endin
</CsInstruments>
<CsScore>
; p4 = winsize, p5 = order
i 1 0    1.5  3  2  ; window as short as the order allows: almost unfiltered
i 1 2    1.5 31  0  ; moving average over 31 samples: dark
i 1 4    1.5 31  2  ; same window, order 2: brighter
i 1 6    1.5 31  6  ; same window, order 6: brighter still
i 1 8    1.5 81  6  ; longer window, same order: darker again
e
</CsScore>
</CsoundSynthesizer>
