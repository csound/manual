<CsoundSynthesizer>
<CsOptions>
-F -odac
</CsOptions>
<CsInstruments>
0dbfs=1

mf@global:i = midifileopen("catherine.mid")

instr Len
 print(midifilelen(mf))
 exitnow(0)
endin

schedule(Len,0,0)


</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
