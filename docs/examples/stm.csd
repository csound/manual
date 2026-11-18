<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o stm.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

; A state machine that shapes a texture. The graph only says which node is
; current and which moves are allowed:
;
;   Calm -> Build -> Burst -> Calm or Build
;
; What each node does is an ordinary UDO. It writes the shared state and,
; when its time is up, asks for the next node with stmnext.

struct Texture cutoff:k, rate:k

opcode CalmNode(r:i, tx:Texture, t:k):void
  tx.cutoff = 500
  tx.rate = 1
  if t >= 3 then
    stmnext(r, "Build")
  endif
endop

opcode BuildNode(r:i, tx:Texture, t:k):void
  tx.cutoff = 500 + t * 1500     ; opens up during the node
  tx.rate = 1 + t * 3
  if t >= 2 then
    stmnext(r, "Burst")
  endif
endop

opcode BurstNode(r:i, tx:Texture, t:k):void
  tx.cutoff = 6000
  tx.rate = 12
  if t >= 1.5 then
    ; a conditional edge: Burst may go to either node
    if random:k(0, 1) < 0.5 then
      stmnext(r, "Calm")
    else
      stmnext(r, "Build")
    endif
  endif
endop

; build the graph once, in the global space
builder:i = stmcreate()
stmaddnode(builder, "Calm")
stmaddnode(builder, "Build")
stmaddnode(builder, "Burst")
stmaddedge(builder, "Calm", "Build")
stmaddedge(builder, "Build", "Burst")
stmaddcondedge(builder, "Burst", ["Calm", "Build"])
gi_definition@global:i = stmcompile(builder)

instr 1
  r:i = stminstance(gi_definition)
  tx:Texture = init(500, 1)

  ; the runtime loop: current node -> its UDO -> stmadvance
  node:S = stmcurrent(r)
  t:k = stmnodetime(r)
  if strcmpk(node, "Calm") == 0 then
    CalmNode(r, tx, t)
  elseif strcmpk(node, "Build") == 0 then
    BuildNode(r, tx, t)
  else
    BurstNode(r, tx, t)
  endif
  status:k, from:k, to:k = stmadvance(r)
  if status == 1 then
    printks("%5.2f s: %s -> %s\n", 0, timeinsts(), stmnodename(r, from), stmnodename(r, to))
  endif

  ; the sound only reads the shared state
  pulse:k = 0.5 + 0.5 * lfo(1, tx.rate, 0)
  cutoff:k = portk(tx.cutoff, 0.1)
  env:k = linseg(0, 0.5, 1, p3 - 1, 1, 0.5, 0)
  sig:a = vco2(0.1, 110) + vco2(0.1, 165) + vco2(0.1, 220.5)
  sig = moogladder(sig, cutoff, 0.4) * pulse * env
  out(sig, sig)
endin
</CsInstruments>
<CsScore>
i 1 0 20
e
</CsScore>
</CsoundSynthesizer>
