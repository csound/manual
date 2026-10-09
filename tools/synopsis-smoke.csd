<CsoundSynthesizer>
<CsOptions>
--syntax-check-only -n -d
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

; Compile only: no files, MIDI devices, or instruments are opened or run.
instr 1
  isig = 0.25
  ksig = 0.25
  asig = 0.25
  ipow = pow(isig, 2)
  kpow = pow(ksig, 2)
  apow = pow(asig, 2, 1)
  ilim = limit(isig, 0, 1)
  klim = limit(ksig, 0, 1)
  alim = limit(asig, 0, 1)
  iValues[] fillarray 0, 1, 2, 3
  kValues[] fillarray 0, 1, 2, 3
  iLimited[] = limit(iValues, 0, 1)
  kLimited[] = limit(kValues, 0, 1)
  iPowers[] = pow(iValues, 2)
  kPowers[] = pow(kValues, 2)
  tableshuffle(1)
  tableshufflei(1)
  aLeft, aRight = pan2(asig, 0.5)
  aPair[] = pan2(asig, 0.5)
  kArray[] = genarrayi(0, 3)
  kMapped[] = maparray(kArray, "abs")
  kMappedInit[] = maparrayi(kArray, "abs")
  iGenerated[] = genarray(0, 3)
  kGenerated[] = genarray(0, 3)
  kSlice[] = slicearray(kArray, 0, 2)
endin

instr 2
  iFile = midifileopen("test.mid")
  kFile init 0
  kLoop init 1
  midifileloop(1)
  midifileloop(kLoop, kFile)
  midifileloop 1, iFile
  midifileloop kLoop, kFile
  iPos = midifilepos(iFile)
  kPos = midifilepos(kFile)
  midifilepos(0, iFile)
  midifilepos(kPos, kFile)
  midifiletempo(120, iFile)
  midifiletempo(kLoop, kFile)
  kStatus = midifilestatus(iFile)
  iStat, iChan, iData1, iData2, iTime = midifilein(0, iFile)
  kStat, kChan, kData1, kData2, kTime = midifilein(kLoop, iFile)
  iStat2, iChan2, iData12, iData22, iTime2 midifilein 0
  kStat2, kChan2, kData12, kData22, kTime2 midifilein kLoop
  midion2(1, 60, 100, kLoop)
  midion2 1, 60, 100, kLoop
  outic(1, 1, 0.5, 0, 1)
  outic 1, 1, 0.5, 0, 1
  outic14 1, 1, 2, 0.5, 0, 1
  outiat(1, 0.5, 0, 1)
  outipc(1, 1, 0, 127)
  noteondur2(1, 60, 100, 0.1)
  noteondur2 1, 60, 100, 0.1
  schedkwhen(kLoop, 0, 1, 10, 0, 1)
  schedkwhen(kLoop, 0, 1, "Target", 0, 1, 0.5)
endin

instr 3
  kSamples[] init 8
  kSpectrum[] = fft(kSamples)
  spectrum:Complex[] = fft(kSamples)
  inverse:Complex[] = fft(spectrum, 1)
  inverse2:Complex[] fft spectrum, 1
  kReal[] = fft(spectrum)
  a1, a2, kTime = mp3scal("test.mp3", 1, 1, 0.3)
  kLock init 1
  kInterp init 1
  a3, a4, kTime2 = mp3scal("test.mp3", 1, 1, 0.3, 0, 2048, 4, kLock, kInterp)
  fsig = pvstanal(1, 0.3, 1, 1)
  aMono loscil 0.3, 1, 1, 1, 1
  aLeft, aRight loscil 0.3, 1, 1, 1, 1
  aCubic loscil3 0.3, 1, 1, 1, 1
  aCubicLeft, aCubicRight loscil3 0.3, 1, 1, 1, 1
  kCeps[] init 9
  kEnvelope[] = cepsinv(kCeps)
  audio:a[] = inletv("input")
endin

instr 10, Target
endin
</CsInstruments>
<CsScore>
f 0 0.1
</CsScore>
</CsoundSynthesizer>
