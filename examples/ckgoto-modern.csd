<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    No messages
-odac
-d
; -iadc     ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o ckgoto.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
kr =  4410
ksmps = 10
nchnls = 1

; Instrument #1.
instr 1
  ; Change kval linearly from 0 to 2 over
  ; the period set by the third p-field.
  val:k = line(0, p3, 2)

  ; If kval is greater than or equal to 1 then play the high note.
  ; If not then play the low note.
  ckgoto(val >= 1, highnote)
  kgoto(lownote)

highnote:
  freq:k = 880
  goto(playit)

lownote:
  freq = 440

playit:
  ; Print the values of kval and kfreq.
  printks("val = %f, freq = %f\\n", 1, val, freq)
  out(poscil(10000, freq))
endin

</CsInstruments>
<CsScore>

; Play Instrument #1 for two seconds.
i 1 0 2
e

</CsScore>
</CsoundSynthesizer>