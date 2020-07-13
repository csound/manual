<CsoundSynthesizer>

<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    Silent  MIDI in
-odac
-d
</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1

instr 1
  prints "instr 1 started ... "
  aenv linsegr 0, 0.1, 1, 0.1, 0
  asig =  oscili(0.1, 1000)
  asig += oscili(0.1, 1012)
  asig *= aenv
  if lastcycle() == 1 then
    schedulek p1, 0, p3
    println "instr 1 stopped"
  endif
  outs asig, asig
endin
  
instr 2
  ; Test lastcycle without extra time and fixed duration
  ; It should detect that it's being deleted without the
  ; need of a *r opcode like linsegr or xtratim 
  if lastcycle() == 1 then
    println "<<<  Last cycle!  >>>"
  endif
endin

instr turnoff
  ip1 = p4
  turnoff2 ip1, 4, 1
  turnoff
endin


</CsInstruments>

<CsScore>
i 2 0 -1
i -2 0.5 0

i 2 1 99
; we need to turn it off via turnoff2 since from the score we can only turn off
; notes with indefinite duration
i "turnoff" 1.5 -1 2

i 1 2 0.5

f 0 3600

</CsScore>

</CsoundSynthesizer>
