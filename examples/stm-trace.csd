<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 480
nchnls = 1
0dbfs = 1

; A scripted run of a small graph. Each control period lasts 10 ms.
; The trace shows what stmadvance returns for each kind of request,
; and how the graph clock moves.

; Idle -> Play, Play -> Play (self edge), Play -> Hold, Hold -> Play or Idle
builder:i = stmcreate()
stmaddnode(builder, "Play")    ; id 0
stmaddnode(builder, "Idle")    ; id 1
stmaddnode(builder, "Hold")    ; id 2
stmentry(builder, "Idle")      ; start from Idle instead of id 0
stmaddedge(builder, "Idle", "Play")
stmaddedge(builder, "Play", "Play")
stmaddedge(builder, "Play", "Hold")
stmaddcondedge(builder, "Hold", ["Play", "Idle"])
definition:i = stmcompile(builder)
gi_runner@global:i = stminstance(definition)

instr 1
  r:i = gi_runner
  cycle:k init 0
  cycle += 1

  if cycle == 1 then
    printks("%d nodes, %d edges: %s %s %s\n", 0, stmnodecount(r), stmedgecount(r), \
            stmnodename(r, 0), stmnodename(r, 1), stmnodename(r, 2))
    printks("cyc node   id  tick  time  nodetime  request       status from to\n", 0)
  endif

  ; read the node and the clock before stmadvance
  node:S = stmcurrent(r)
  id:k = stmcurrentid(r)
  tick:k = stmtick(r)
  time:k = stmtime(r)
  nodetime:k = stmnodetime(r)

  request:S = strcpyk("-")
  if cycle == 2 then
    stmnext(r, "Play")
    request = strcpyk("Play")
  elseif cycle == 3 then
    stmnext(r, "Idle")              ; there is no Play -> Idle edge
    request = strcpyk("Idle")
  elseif cycle == 4 then
    stmnext(r, "Play")              ; self edge
    request = strcpyk("Play")
  elseif cycle == 5 then
    stmnext(r, "Hold")              ; two different requests
    stmnext(r, "Idle")
    request = strcpyk("Hold+Idle")
  elseif cycle == 6 then
    stmnext(r, stmnodeid(r, "Hold"))  ; request by id
    request = strcpyk("id of Hold")
  elseif cycle == 8 then
    stmreset(r, 1)                  ; back to the entry node, Idle
    request = strcpyk("reset")
  endif

  status:k, from:k, to:k = stmadvance(r)
  printks("%3d %-5s %3d %5d %5.2f %9.2f  %-12s %6d %4d %2d\n", 0, \
          cycle, node, id, tick, time, nodetime, request, status, from, to)

  if cycle == 9 then
    turnoff
  endif
endin
</CsInstruments>
<CsScore>
i 1 0 1
e
</CsScore>
</CsoundSynthesizer>
