<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    No messages
-odac       ;;    -iadc     -d     ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o oscilbank.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr     = 44100
ksmps  = 32
nchnls = 2
0dbfs  = 1

; By Stefano Cucchi 2020


instr 1
  cps:k = init(300)
  amd:k = init(3)
  fmd:k = init(2)
  pmd:k = init(2.3)
  ovrlap:i = p4
  Seed:i = 0.2
  l1minf:k = init(1.1)
  l1maxf:k = init(2.3)
  l2minf:k = init(0.2)
  l2maxf:k = init(1.5)
  lfomode:i = 64 + 16 + 8 + 2 ; LFO1 to amplitude + LFO1 to EQ \
                              ; + LFO2 to frequency + LFO2 to phase 
  eqminf:k = init(20)
  eqmaxf:k = init(12000)
  eqminl:k = init(0.1)
  eqmaxl:k = init(23)
  eqminq:k = init(0.2)
  eqmaxq:k = init(2)
  eqmode:i = 1
  fn:k = init(1)

  a1 = oscilbank(cps, amd, fmd, pmd, ovrlap, Seed, l1minf, l1maxf, l2minf, l2maxf, \
                 lfomode, eqminf, eqmaxf, eqminl, eqmaxl, eqminq, eqmaxq, eqmode, \
                 fn, 2, 2, 2, 2, 2)
  declick:k = linseg(0, 0.3, 0.9, p3-0.6, 0.9, 0.3, 0)
  out(a1*0.003*declick, a1*0.003*declick)
endin

</CsInstruments>
<CsScore>
f1 0 4096 10 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1
f2 0 4096 10 1 

i1 0 4 3
i1 5 4 32
e
</CsScore>
</CsoundSynthesizer>
