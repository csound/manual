<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

instr   1
  when:k = init(0)
  Metro:k = metro(1)
  when += Metro
  oscsend(when, "127.0.0.1", 7771, "/foo/bar", "f", when)
endin

instr 2
  Smess[] = init(3)
top:
  Smess, ka = oscraw(7771)
  n:k = 0
  while n < ka do
    printf(": %s ", n+1, Smess[n])
    n += 1
  od
  printf("%d items\n", ka, n)
  if ka > 0 kgoto top
endin

</CsInstruments>
<CsScore>
i1 0 10
i2 0 10
</CsScore>
</CsoundSynthesizer>