<CsoundSynthesizer>
<CsOptions>
--midifile -odac
</CsOptions>
<CsInstruments>
0dbfs=1

mf@global:i = midifileopen("catherine.mid")

instr Midisynth
 midifileplay(mf)
 amp:i = ampmidi(0.2)
 cps:i = cpsmidi()
 sig:a  = vco2(amp,cps)
 env:a  = madsr(0.001, 0.5, 0.1, 0.1)
   out(sig*env)
endin

instr SetPos
 midifilepos(p4,mf)
endin

instr GetPos
printk 1, midifilepos:k(mf)
endin

schedule(Midisynth,0,0)
schedule(GetPos,0,-1)
schedule(SetPos,5,0,10)
schedule(SetPos,10,0,5)
event_i("e", 0, midifilelen(mf))

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
