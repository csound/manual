<CsoundSynthesizer> 
<CsOptions> 
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
-d        ;;;no display
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
;-Wfo alwayson.wav 
</CsOptions> 
<CsInstruments> 

; Initialize the global variables. 

sr     = 44100
ksmps  = 32
nchnls = 2
0dbfs  = 1

; Connect up instruments and effects to create the signal flow graph. 

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

; Define instruments and effects in order of signal flow.

instr SimpleSine 
                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Default values:
  ;    p4  p5  p6  p7  p8  p9  p10
  pset(0,  0,  10, 0,  0,  0,  0.5)
  attack:i    = 0.015
  decay:i     = 0.07
  sustain:i   = p3
  rel:i       = 0.3
  p3          = attack + decay + sustain + rel
  damping:a   = linsegr(0.0, attack, 1.0, decay + sustain, 1.0, rel, 0.0)
  Hz:i        = cpsmidinn(p4) 
  ; Rescale MIDI velocity range to a musically usable range of dB. 
  amplitude:i = ampdb(p5/127 * 15.0 + 60.0) / 32767
  ; Use ftgenonce instead of ftgen, ftgentmp, or f statement. 
  cosine:i    = ftgenonce(0, 0, 65537, 11, 1)
  aoscili     = oscili(amplitude, Hz, cosine)
  aadsr       = madsr(attack, decay, 0.6, rel)
  signal:a    = aoscili * aadsr 
  left:a, right:a = pan2(signal, p7)
  ; Stereo audio output to be routed in the orchestra header. 
  outleta("leftout", left)
  outleta("rightout", right)
endin 

instr Moogy 
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Default values:
  ;    p4  p5  p6  p7  p8  p9  p10
  pset(0,  0,  10, 0,  0,  0,  0.5)
  attack:i     = 0.003
  sustain:i    = p3
  rel:i        = 0.05
  p3           = attack + sustain + rel
  damping:a    = linsegr(0.0, attack, 1.0, sustain, 1.0, rel, 0.0)
  Hz:i         = cpsmidinn(p4)
  ; Rescale MIDI velocity range to a musically usable range of dB. 
  amplitude:i  = ampdb(p5/127 * 20.0 + 60.0) / 32767
  print(Hz, amplitude)
  ; Use ftgenonce instead of ftgen, ftgentmp, or f statement. 
  sine:i       = ftgenonce(0, 0, 65537, 10, 1)
  signal:a     = vco(amplitude, Hz, 1, 0.5, sine) 
  fco:k        = line(2000, p3, 200)
  rez:k        = 0.8 
  signal       = moogvcf(signal, fco, rez, 100000)
  signal       *=  damping
  left:a, right:a = pan2(signal, p7)
  ; Stereo audio output to be routed in the orchestra header. 
  outleta("leftout", left)
  outleta("rightout", right)
endin

instr Reverberator 
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Stereo input. 
  leftin:a    = inleta("leftin") 
  rightin:a   = inleta("rightin") 
  delay_dur:i = p4 
  cutoff:i    = p5 
  left:a, right:a = reverbsc(leftin, rightin, delay_dur, cutoff)
  ; Stereo output. 
  outleta("leftout", left)
  outleta("rightout", right)
endin 

instr Compressor 
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Stereo input. 
  leftin:a    = inleta("leftin") 
  rightin:a   = inleta("rightin") 
  threshold:k = 25000 
  comp1:i     = 0.5 
  comp2:i     = 0.763 
  rtime:i     = 0.1
  ftime:i     = 0.1 
  leftout:a   = dam(leftin, threshold, comp1, comp2, rtime, ftime) 
  rightout:a  = dam(rightin, threshold, comp1, comp2, rtime, ftime) 
  ; Stereo output. 
  outleta("leftout", leftout)
  outleta("rightout", rightout)
endin 

instr Soundfile 
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Stereo input. 
  leftin:a    = inleta("leftin") 
  rightin:a   = inleta("rightin") 
  outs(leftin, rightin)
endin 

</CsInstruments> 
<CsScore> 

; It is not necessary to activate "effects" or create f-tables in the score! 
; Overlapping notes create new instances of instruments with proper connections. 

i "SimpleSine" 1 5 60 85 
i "SimpleSine" 2 5 64 80 
i "Moogy" 3 5 67 75 
i "Moogy" 4 5 71 70 
; 1 extra second after the performance
e 1 

</CsScore> 
</CsoundSynthesizer> 