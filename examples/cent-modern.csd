<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  -d   ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o cent.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs =  1

instr 1 ; original pitch
  root:i = 440     ; root note = A (440 Hz)
  print(root)      ;print out
  sig:a = oscili(0.6, root, 1)
  outs(sig, sig)
endin

instr 2
  root:i = 440    ; root note = A (440 Hz)
  cents:i = p4    ; change root note by 300 and 1200 cents

  factor:i = cent(cents) ; calculate new note
  new:i = root * factor

  print(root)     ; Print all
  print(factor)
  print(new)

  sig:a = oscili(0.6, new, 1)
  outs(sig, sig)
endin

</CsInstruments>
<CsScore>
; sine wave
f1 0 32768 10 1

i 1 0   2        ;no change
i 2 2.5 2 300    ;note = C above A
i 2 5   2 1200   ;1 octave higher 

e

</CsScore>
</CsoundSynthesizer>