<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac    ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o mxadsr.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; by Menno Knevel - 2021
; example shows mxadsr use without any incoming midi events
sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
 	 	 	 
kenv	mxadsr	p4, 0, 1, 0.3        ;change attack time with p4
asig	pluck	kenv, 220, 100, 2, 1	 
	outs	asig, asig
	 
endin
</CsInstruments>
<CsScore>
f 2 0 4096 10 1	
i1 0 1 .01
i1 2 1 .5
i1 4 1 .9
e
</CsScore>
</CsoundSynthesizer>
