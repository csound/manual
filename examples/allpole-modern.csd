<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 1
0dbfs  = 1

fw@global:i = ftgen(0, 0, 1024, 20, 2, 1)

instr 1
  a1 = diskin("fox.wav", 1, 0, 1)
  cfs:k[], krms, err:k, cps:k = lpcanal(a1, 1, 128, 1024, 64, fw)
  if cps > 180 then
    cps = 180
  endif
  a2 = buzz(0dbfs, cps, sr/(cps*2), -1)
  a3 = allpole(a2*krms*err, cfs)
  out(dcblock(a3))
endin

</CsInstruments>
<CsScore>
i1 0 30
</CsScore>
</CsoundSynthesizer>