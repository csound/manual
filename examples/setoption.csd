<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr EmbeddedTone
  engine:Csound = create()

  // Configure the embedded engine before compiling or starting it.
  // -n keeps it from writing a sound file. The main engine handles output.
  iOptions = setoption(engine, "-n -d -m0")
  if iOptions != 0 then
    prints("Could not set the embedded engine's options.\n")
    exitnow(1)
  endif

  iCompile = compilestr(engine, {{
    sr = 48000
    ksmps = 32
    nchnls = 1
    0dbfs = 1

    instr Tone
      aEnvelope = linen(0.15, 0.01, p3, 0.1)
      aTone = oscili(aEnvelope, 330)
      out(aTone)
    endin
    schedule("Tone", 0, 1.5)
  }})
  if iCompile != 0 then
    prints("Could not compile the embedded orchestra.\n")
    exitnow(1)
  endif

  iStart = start(engine)
  if iStart != 0 then
    prints("Could not start the embedded engine.\n")
    exitnow(1)
  endif

  // Run the embedded engine and read its first output channel.
  kStatus = perf(engine)
  aTone = inch(engine, 1)
  out(aTone)

  // Keep the engine until this instrument ends.
  delete(engine)
endin
</CsInstruments>
<CsScore>
i "EmbeddedTone" 0 1.5
e
</CsScore>
</CsoundSynthesizer>
