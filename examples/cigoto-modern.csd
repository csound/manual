<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac
-d
;          -iadc     ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o cigoto.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
kr =  4410
ksmps = 10
nchnls = 1

; Instrument #1.
instr 1
  ; Get the value of the 4th p-field from the score.
  param:i = p4

  ; If iparam is 1 then play the high note.
  ; If not then play the low note.
  cigoto(param == 1, highnote)
  igoto(lownote)

highnote:
  freq:i = 880
  goto(playit)

lownote:
  freq = 440

playit:
  ; Print the values of iparam and ifreq.
  print(param)
  print(freq)

  out(poscil(10000, freq))
endin

</CsInstruments>
<CsScore>

; p4: 1 = high note, anything else = low note
; Play Instrument #1 for one second, a low note.
i 1 0 1 0
; Play a Instrument #1 for one second, a high note.
i 1 1 1 1
e

</CsScore>
</CsoundSynthesizer>