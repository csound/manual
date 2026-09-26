<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac
; -iadc    ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o subinstr_named.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
kr =  4410
ksmps = 10
nchnls = 1

; Instrument "basic_tone" - Creates a basic tone.
instr basic_tone
  ; Print the value of p4, should be equal to
  ; Instrument #2's amp field.
  print(p4)

  ; Print the value of p5, should be equal to
  ; Instrument #2's pch field.
  print(p5)

  ; Create a tone.
  out(oscils(p4, p5, 0))
endin

; Instrument #1 - Demonstrates the subinstr opcode.
instr 1
  amp:i = 20000
  pch:i = 440

  ; Use the "basic_tone" named instrument to create a 
  ; basic sine-wave tone.
  ; Its p4 parameter will be set using the amp variable.
  ; Its p5 parameter will be set using the pch variable.
  basic:a = subinstr("basic_tone", amp, pch)

  ; Output the basic tone that we have created.
  out(basic)
endin

</CsInstruments>
<CsScore>

; Play Instrument #1 for one second.
i 1 0 1
e

</CsScore>
</CsoundSynthesizer>