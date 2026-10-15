<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 1
0dbfs =  1

fw@global:i = ftgen(0, 0, 1024, 20, 2, 1)

instr 1
  per:k = init(sr)
  a1 = diskin("flute.aiff", 1, 0, 1)
  cfs:k[], krms, err:k, cps:k = lpcanal(a1, 1, 512, 1024, 10, fw)
  par:k[] = apoleparams(cfs)
  if per >= sr then
    cnt:k = 0
    per = 0
  endif
  per += ksmps
  while cnt < 5 do
    printf("t:%.1f filter %d freq: %.1f bw: %.1f\n", cnt+1, times:k(), cnt, par[cnt], par[cnt+1])
  cnt += 1
  od
  out(a1)
endin

</CsInstruments>
<CsScore>
i1 0 20
</CsScore>
</CsoundSynthesizer>
