<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr CheckCode
  SCode = {{
    instr Candidate
      aTone = oscili(0.1, 440)
      out(aTone)
    endin
  }}

  // Compile the definition in a separate engine.
  engine:Csound = create()
  iResult = compilestr(engine, SCode)

  // We only need the result, so release the engine now.
  destroy(engine)

  // iResult belongs to this instrument and remains available.
  if iResult == 0 then
    prints("The instrument definition compiled successfully.\n")
  else
    prints("The instrument definition could not be compiled.\n")
  endif
endin
</CsInstruments>
<CsScore>
i "CheckCode" 0 0.1
e
</CsScore>
</CsoundSynthesizer>
