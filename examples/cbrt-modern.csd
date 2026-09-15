<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

instr 1
  Arg:i[] = fillarray(1, 2, 3)
  Res:i[] = cbrt(Arg)

  ik = init(0)
  while ik < lenarray(Res) do
    print(Res[ik])
    ik += 1
  od

endin

</CsInstruments>
<CsScore>
i1 0 0
</CsScore>
</CsoundSynthesizer>