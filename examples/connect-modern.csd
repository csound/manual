<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac -d    ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o connect.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

/* Written by Michael Gogins */
; Initialize the global variables.
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Connect up the instruments to create a signal flow graph.

connect("SimpleSine", "leftout",  "Reverberator", "leftin")
connect("SimpleSine", "rightout", "Reverberator", "rightin")

connect("Moogy", "leftout",  "Reverberator", "leftin")
connect("Moogy", "rightout", "Reverberator", "rightin")

connect("Reverberator", "leftout",  "Compressor", "leftin")
connect("Reverberator", "rightout", "Compressor", "rightin")

connect("Compressor", "leftout",  "Soundfile", "leftin")
connect("Compressor", "rightout", "Soundfile", "rightin")

; Turn on the "effect" units in the signal flow graph.

alwayson("Reverberator", 0.91, 12000)
alwayson("Compressor")
alwayson("Soundfile")

instr SimpleSine
  hz:i = cpsmidinn(p4)
  amplitude:i = ampdbfs(p5)
  print(hz, amplitude)
  ; Use ftgenonce instead of ftgen, ftgentmp, or f statement.
  sine:i = ftgenonce(0, 0, 4096, 10, 1)
  a1 = oscili(amplitude, hz, sine)
  env:a = madsr(0.05, 0.1, 0.5, 0.2)
  signal:a = a1 * env
  ; Stereo audio outlet to be routed in the orchestra header.
  outleta("leftout", signal * 0.25)
  outleta("rightout", signal * 0.75)
endin

instr Moogy
  hz:i = cpsmidinn(p4)
  amplitude:i = ampdbfs(p5)
  ; Use ftgenonce instead of ftgen, ftgentmp, or f statement.
  sine:i = ftgenonce(0, 0, 4096, 10, 1)
  signal:a = vco(amplitude, hz, 1, 0.5, sine)
  fco:k = line(200, p3, 2000)
  rez:k = init(0.9)
  signal = moogvcf(signal, fco, rez, 3.05)
  ; Stereo audio outlet to be routed in the orchestra header.
  outleta("leftout", signal * 0.75)
  outleta("rightout", signal * 0.25)
endin

instr Reverberator
  ; Stereo input.
  leftin:a = inleta("leftin")
  rightin:a = inleta("rightin")
  Delay:i = p4
  cutoff:i = p5
  leftout:a, rightout:a = reverbsc(leftin, rightin, Delay, cutoff)
  ; Stereo output.
  outleta("leftout", leftout)
  outleta("rightout", rightout)
endin

instr Compressor
  ; Stereo input.
  leftin:a = inleta("leftin")
  rightin:a = inleta("rightin")
  threshold:k = 0.76
  comp1:i = 0.5
  comp2:i = 0.763
  rtime:i = 0.1
  ftime:i = 0.1
  leftout:a = dam(leftin, threshold, comp1, comp2, rtime, ftime)
  rightout:a = dam(rightin, threshold, comp1, comp2, rtime, ftime)
  ; Stereo output.
  outleta("leftout", leftout)
  outleta("rightout", rightout)
endin

instr Soundfile
  ; Stereo input.
  leftin:a = inleta("leftin")
  rightin:a = inleta("rightin")
  outs(leftin, rightin)
endin

</CsInstruments>
<CsScore>
; Not necessary to activate "effects" or create f-tables in the score!
; Overlapping notes to create new instances of instruments.
i "SimpleSine" 1 5 60 -5
i "SimpleSine" 2 5 64 -10
i "Moogy" 3 5 67 -15
i "Moogy" 4 5 71 -20
;6 extra seconds after the performance
e 12
</CsScore>
</CsoundSynthesizer>