<CsoundSynthesizer>
<CsOptions>
; Render to a file so loading never interrupts live audio.
-o json-score.wav -W -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

struct JsonNote start:i, duration:i, pitch:i, amplitude:i, pan:i
struct JsonScore title:S, tempo:i, notes:JsonNote[]

instr JsonTone
  envelope:a = linseg(0, p3 * 0.1, p5, p3 * 0.8, p5, p3 * 0.1, 0)
  tone:a = poscil(envelope, cpsmidinn(p4))
  left:a, right:a = pan2(tone, p6)
  out(left, right)
endin

; Return the score length in seconds. Starts and durations in JSON use beats.
opcode PlayJsonScore(path:S):(i)
  score:JsonScore = jsonunmarshalfile(path)
  if score.tempo <= 0 then
    prints("Score tempo must be greater than zero.\n")
    exitnow(1)
  endif
  secondsPerBeat:i = 60 / score.tempo
  count:i = lenarray(score.notes)
  endTime:i = 0

  if count > 0 then
    ; JSON checks types. This pass checks the musical limits before any scheduling.
    for note, index in score.notes do
      if note.start < 0 || note.duration <= 0 || \
         note.pitch < 0 || note.pitch > 127 || \
         note.amplitude < 0 || note.amplitude > 0.25 || \
         note.pan < 0 || note.pan > 1 then
        prints("Invalid score.notes[%d]: check time, pitch, amplitude and pan.\n", index)
        exitnow(1)
      endif
      endTime = max(endTime, (note.start + note.duration) * secondsPerBeat)
    od

    for note in score.notes do
      schedule(JsonTone, note.start * secondsPerBeat, \
               note.duration * secondsPerBeat, note.pitch, note.amplitude, note.pan)
    od
  endif
  prints("%s: %d notes, %.2f seconds\n", score.title, count, endTime)
  xout(endTime)
endop

instr LoadScore
  duration:i = PlayJsonScore("jsonunmarshalfile-score.json")
  ; Keep the performance running until the last scheduled note ends.
  eventi("e", 0, duration + 0.1)
endin
</CsInstruments>
<CsScore>
i "LoadScore" 0 0.01
f 0 z
</CsScore>
</CsoundSynthesizer>
