<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

gaBus init 0

instr Source
  gaBus poscil 0.1, 440
endin

instr 1
  source:Instr = create(Source)
  iStatus = init(source)
  ; Insert the new source immediately before this instrument.
  iStatus = splice(source, this, 0)
  if iStatus != 0 then
    exitnow -1
  endif

  ; Csound now performs source through its active list.
  ; Do not also call perf(source).
  aEnvelope linseg 0, 0.01, 1, p3 - 0.02, 1, 0.01, 0
  out gaBus * aEnvelope
  delete(source)
endin
</CsInstruments>
<CsScore>
i 1 0 1
e
</CsScore>
</CsoundSynthesizer>
