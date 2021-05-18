<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac    ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o adsr-group.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; by Menno Knevel - 2021

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
 	 	 	 
kenv	adsr	p4, .5, .5, 0.3    	; linear envelope 
asig	pluck	kenv, 220, 220, 2, 1	; A+D+S+R = p3 	 
	outs	asig, asig
	 
endin
instr 2
 	 	 	 
kenv	xadsr	p4, .5 , .5, 0.3        ; exponential envelope
asig	pluck	kenv, 220, 220, 2, 1	; A+D+S+R = p3 	 
	outs	asig, asig
	 
endin
instr 3
 	 	 	 
kenv	madsr	p4, .5, .5, 0.3	        ; linear envelope
asig	pluck	kenv, 220, 220, 2, 1	; A+D+S = p3		 
	outs	asig, asig	        ; then go into Release stage
	 
endin
instr 4
 	 	 	 
kenv	mxadsr	p4, .5 , .5, 0.3	; exponential envelope
asig	pluck	kenv, 220, 220, 2, 1	; A+D+S = p3	 
	outs	asig, asig		; then go into Release stage
	 
endin
</CsInstruments>
<CsScore>
f 2 0 4096 10 1	
s
i1 0 2 .01
i1 4 . .5
i1 8 . .9
s
i2 0 2 .01
i2 4 . .5
i2 8 . .9
s
i3 0 2 .01
i3 4 . .5
i3 8 . .9
s
i4 0 2 .01
i4 4 . .5
i4 8 . .9
e
</CsScore>
</CsoundSynthesizer>
