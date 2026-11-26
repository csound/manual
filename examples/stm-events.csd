<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 480
nchnls = 1
0dbfs = 1

; Watching a runner: stmonenter and stmonexit fire on transitions, and
; stmevent reads every runner event in order, including pause, resume
; and delete. The writer and the observers are in different instruments.

; A <-> B, plus a self edge on B
builder:i = stmcreate()
stmaddnode(builder, "A")    ; id 0
stmaddnode(builder, "B")    ; id 1
stmaddedge(builder, "A", "B")
stmaddedge(builder, "B", "A")
stmaddedge(builder, "B", "B")
gi_runner@global:i = stminstance(stmcompile(builder))

; the writer: a scripted sequence of requests and controls
instr 1
  r:i = gi_runner
  cycle:k init 0
  cycle += 1

  if cycle == 1 then
    stmnext(r, "B")
  elseif cycle == 2 then
    stmnext(r, "B")               ; self transition
  elseif cycle == 4 then
    stmnext(r, "A")               ; ignored: the runner is paused
  elseif cycle == 6 then
    stmnext(r, "A")
  elseif cycle == 8 then
    stmnext(r, "B")               ; ignored: the runner is deleted
  endif

  stmpause(r, cycle == 3 ? 1 : 0)
  stmresume(r, cycle == 5 ? 1 : 0)
  stmdelete(r, cycle == 7 ? 1 : 0)

  status:k, from:k, to:k = stmadvance(r)
  printks("cycle %d: advance status %d\n", 0, cycle, status)
endin

; an observer, scheduled after the writer in each control period
instr 2
  r:i = gi_runner
  enterB:k = stmonenter(r, "B")
  exitB:k = stmonexit(r, "B")
  if enterB == 1 || exitB == 1 then
    printks("  enter B %d, exit B %d\n", 0, enterB, exitB)
  endif

  ; drain every event published since the previous pass
  more:k = 1
  while more == 1 do
    kind:k, seq:k, lost:k, more, from:k, to:k = stmevent(r)
    if more == 1 then
      printks("  event %d: kind %d, %d -> %d, overflow %d\n", 0, seq, kind, from, to, lost)
    endif
  od
endin
</CsInstruments>
<CsScore>
i 1 0 0.09
i 2 0 0.09
e
</CsScore>
</CsoundSynthesizer>
