; Instrument code included by includestr.csd.
instr 1
  prints "Instrument 1 loaded from includestr-tone.inc\n"
  aEnv linseg 0, 0.01, 1, p3 - 0.02, 1, 0.01, 0
  aTone vco2 0.15, 440
  out aTone * aEnv, aTone * aEnv
endin
