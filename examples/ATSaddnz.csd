<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc for RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o ATSaddnzwav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; by Menno Knevel - 2021

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

;ATSA wants a mono file!
ires system_i 1,{{ atsa beats.wav beats.ats }} ; default size

instr 1	

ktime	line     0, p3, p3
asig	ATSaddnz ktime, "beats.ats", 1, 4   ; only 1 noise band, the 4th noise band
	outs	asig*6, asig*6	;amplify
endin

</CsInstruments>
<CsScore>
i1 0 2 
e
</CsScore>
</CsoundSynthesizer>
