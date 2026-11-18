<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 480
nchnls = 1
0dbfs = 1

; stmcall saves the state of a runner under a name, stmrecall brings it
; back. The runner walks a chain of sections, one per control period.
; The state at "Verse" is saved, and recalled twice from "Outro", so the
; walk from "Verse" is repeated with the same node and the same clock.
; A name works as a save slot: each save under "verse" replaces the last.

builder:i = stmcreate()
stmaddnode(builder, "Intro")
stmaddnode(builder, "Verse")
stmaddnode(builder, "Chorus")
stmaddnode(builder, "Outro")
stmaddedge(builder, "Intro", "Verse")
stmaddedge(builder, "Verse", "Chorus")
stmaddedge(builder, "Chorus", "Outro")
gi_runner@global:i = stminstance(stmcompile(builder))

instr 1
  r:i = gi_runner
  cycle:k init 0
  cycle += 1

  node:S = stmcurrent(r)
  tick:k = stmtick(r)

  ; save each time the walk is on Verse (the trigger rises on every pass)
  saved:k = stmcall(r, "verse", strcmpk(node, "Verse") == 0 ? 1 : 0)

  ; one step along the chain per control period
  if strcmpk(node, "Intro") == 0 then
    stmnext(r, "Verse")
  elseif strcmpk(node, "Verse") == 0 then
    stmnext(r, "Chorus")
  elseif strcmpk(node, "Chorus") == 0 then
    stmnext(r, "Outro")
  endif

  status:k, from:k, to:k = stmadvance(r)

  ; at Outro, go back to the saved state, but only twice
  repeats:k init 0
  recall:k = 0
  if strcmpk(node, "Outro") == 0 && repeats < 2 then
    recall = 1
    repeats += 1
  endif
  restored:k = stmrecall(r, "verse", recall)

  printks("cycle %2d  tick %d  %-6s  saved %d  restored %d  -> %s\n", 0, \
          cycle, tick, node, saved, restored, stmcurrent(r))
endin
</CsInstruments>
<CsScore>
i 1 0 0.10
e
</CsScore>
</CsoundSynthesizer>
