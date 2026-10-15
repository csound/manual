<CsoundSynthesizer>
<CsOptions>
--midifile -odac
</CsOptions>
<CsInstruments>
0dbfs=1

mf@global:i = midifileopen("catherine.mid")

instr Events
evts:i = midifilevents(mf)
print evts
exitnow(0)
endin

schedule(Events,0,1)


</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
