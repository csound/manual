<CsoundSynthesizer>
<CsOptions>
--midifile -odac
</CsOptions>
<CsInstruments>
0dbfs=1

mf@global:i = midifileopen("catherine.mid")

instr Read
evts:i = midifilevents(mf)
print evts
cnt:k = 0
while cnt < evts do
 st:k,chn:k,d1:k,d2:k,t:k = midifilein(cnt,mf)
 printf "%d time:%f stat: %d chn: %d data:%d %d\n", cnt, cnt, t,st,chn,d1,d2
 cnt += 1
od
event "e", 0, 0
endin

schedule(Read,0,1)


</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
