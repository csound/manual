<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

fn@global:i = ftgen(0, 0, 0, 1, "Mathews.wav", 0, 0, 1)
fw@global:i = ftgen(0, 0, 1024, 20, 2, 1)

instr 1
  k1 init 0
  ts:k = p4
  cfs:k[], krms, err:k, cps:k = lpcanal(k1, 1, fn, 1024, ksmps, fw)
  if cps > 120 then
    cps = 120
  endif
  a1 = buzz(0dbfs, cps, sr/(cps*2), -1)
  a3 = allpole(a1*krms*err, cfs)
  k1 += ksmps*ts
  if k1 > ftlen(fn) then
    k1 = 0
  endif 
  a3 = dcblock(a3)
  outs(a3*10, a3*10)
endin

</CsInstruments>
<CsScore>
i1 0 10 1
i1 10 10 .2
i1 20 10 1.5
</CsScore>
</CsoundSynthesizer>