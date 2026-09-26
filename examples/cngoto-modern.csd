<CsoundSynthesizer>
<CsOptions>
; Audio out   Audio in
-odac
-d
; -iadc    ;;;RT audio I/O
; -o cngoto.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
ksmps = 10
nchnls = 1

; Instrument #1.
instr 1
  ; Change kval linearly from 0 to 2 over
  ; the period set by the third p-field.
  val:k = line(0, p3, 2)

  ; If kval *is not* greater than or equal to 1 then play
  ; the high note. Otherwise, play the low note.
  cngoto(val >= 1, highnote)
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