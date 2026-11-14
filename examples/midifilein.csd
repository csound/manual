<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs=1

mf@global:i = midifileopen("catherine.mid")

instr Read
evts:i = midifilevents(mf)
print evts
cnt:i = 0
status:i[] = init(evts)
chan:i[] = init(evts)
data1:i[] = init(evts)
data2:i[] = init(evts)
time:i[] = init(evts)
while cnt < evts do
 st:i,chn:i,d1:i,d2:i,t:i = midifilein(cnt,mf)
 // copy events to array       
 status[cnt] = st
 chan[cnt] = chn
 data1[cnt] = d1
 data2[cnt] = d2
 time[cnt] = t
 cnt += 1
od
print status[10]
exitnow()
endin

schedule(Read,0,0)


</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
