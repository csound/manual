<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o ATSreadnz.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; by Menno Knevel - 2021

ires system_i 1,{{ atsa beats.wav beats.ats }} ; default settings

instr 1	

ktime	line	0, p3, 2
kenergy	ATSreadnz ktime, "beats.ats", p4 ; return energy from band p4
anoise	randi	kenergy, 1500          
	outs	anoise *.7, anoise *.7
endin

</CsInstruments>
<CsScore>
;           band
i 1 0 2      6  ; 3 different energy bands
i 1 3 2      12 
i 1 6 2      17 
e

</CsScore>
</CsoundSynthesizer>
