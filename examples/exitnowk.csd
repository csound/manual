<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  ; Fade the tone to silence before stopping the whole performance.
  aEnvelope linseg 0, 0.01, 0.1, 1.92, 0.1, 0.02, 0
  aTone poscil aEnvelope, 440
  out aTone

  kElapsed timeinsts
  if kElapsed >= 2 then
    printks "Stopping after two seconds\n", 0
    ; p4 selects the exit status. Zero requests a successful exit.
    exitnowk(p4)
  endif
endin
</CsInstruments>
<CsScore>
; The score asks for ten seconds, but exitnowk stops it after two.
i 1 0 10 0
e
</CsScore>
</CsoundSynthesizer>
