<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  ; Compile an instrument body and keep its definition in this variable.
  tone:InstrDef = create({{
    aEnvelope linseg 0, 0.01, p4, p3 - 0.02, p4, 0.01, 0
    aTone poscil aEnvelope, p5
    out aTone
  }})

  ; Both notes finish before this containing instrument ends at 1.2 seconds.
  schedule(tone, 0, 0.4, 0.1, 440)
  schedule(tone, 0.6, 0.4, 0.1, 660)

  ; This runs at deinitialization, not here during initialization.
  delete(tone)
endin
</CsInstruments>
<CsScore>
i 1 0 1.2
e
</CsScore>
</CsoundSynthesizer>
