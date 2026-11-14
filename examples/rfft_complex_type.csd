<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
ksmps = 1024 // sets transform size
nchnls = 1
0dbfs = 1

instr 1
 Params:i[] = array(p4, p5)
 Audio:k[] = array(oscili(Params[0],Params[1]))
 Spec:Complex[] = rfft(Audio)
 Wave:k[] = rifft(Spec)
 out a(Wave)
endin
schedule(1,0,2,0.5,440)
event_i("e",0,2)

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>


