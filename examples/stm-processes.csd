<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o stm-processes.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

; Nodes bound to instruments. When a node is entered, its instrument is
; started with a held note; when the node is left, the note is released.
; One definition backs two runners, one per voice, each with its own
; current node and its own clock.
;
;   Drone -> Pulse -> Rest -> Drone

builder:i = stmcreate()
stmaddnode(builder, "Drone")
stmaddnode(builder, "Pulse")
stmaddnode(builder, "Rest")
stmaddedge(builder, "Drone", "Pulse")
stmaddedge(builder, "Pulse", "Rest")
stmaddedge(builder, "Rest", "Drone")
gi_definition@global:i = stmcompile(builder)

; the supervisor of one voice: p4 = voice (1 or 2), p5 = pitch, p6 = tempo
instr 1
  r:i = stminstance(gi_definition)
  drone:i = 10 + p4 / 10      ; 10.1 or 10.2: one note per voice
  pulse:i = 11 + p4 / 10

  ; the entry node has no enter event: start its process explicitly
  schedule(drone, 0, -1, p5)

  node:S = stmcurrent(r)
  t:k = stmnodetime(r) * p6
  if strcmpk(node, "Drone") == 0 && t >= 3 then
    stmnext(r, "Pulse")
  elseif strcmpk(node, "Pulse") == 0 && t >= 2 then
    stmnext(r, "Rest")
  elseif strcmpk(node, "Rest") == 0 && t >= 1 then
    stmnext(r, "Drone")
  endif
  status:k, from:k, to:k = stmadvance(r)

  ; enter and exit checks in the loop that advances the graph
  if stmonenter(r, "Drone") == 1 then
    schedulek(drone, 0, -1, p5)
  endif
  if stmonexit(r, "Drone") == 1 then
    turnoff2(drone, 4, 1)
  endif
  if stmonenter(r, "Pulse") == 1 then
    schedulek(pulse, 0, -1, p5)
  endif
  if stmonexit(r, "Pulse") == 1 then
    turnoff2(pulse, 4, 1)
  endif

  ; release whatever is still playing when the supervisor ends
  if lastcycle() == 1 then
    turnoff2(drone, 4, 1)
    turnoff2(pulse, 4, 1)
  endif
endin

instr 10 ; Drone process
  env:k = madsr(1, 0, 1, 1)
  sig:a = vco2(0.06, p4) + vco2(0.06, p4 * 1.003)
  sig = moogladder(sig, 1200, 0.2) * env
  out(sig, sig)
endin

instr 11 ; Pulse process
  env:k = madsr(0.01, 0, 1, 0.3)
  hit:k = loopseg(4, 0, 0, 1, 0.1, 0, 0.9, 0)
  sig:a = vco2(0.12, p4 * 2, 10) * hit
  sig = moogladder(sig, 3000, 0.1) * env
  out(sig, sig)
endin
</CsInstruments>
<CsScore>
; p4 = voice, p5 = pitch, p6 = tempo of the graph
i 1 0 20 1 110 1
i 1 0 20 2 165 1.5
e 22
</CsScore>
</CsoundSynthesizer>
