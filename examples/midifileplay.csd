<CsoundSynthesizer>
<CsOptions>
-F -odac
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

schedule(Midisynth,0,0)
event_i("e", 0, midifilelen(mf))

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
