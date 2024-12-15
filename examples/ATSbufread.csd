<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac   --limiter=.95  ;;;RT audio out
;-iadc    ;;;uncomment -iadc for RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o ATSbufread.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; by Menno Knevel - 2021

;ATSA wants a mono file!
;it takes a while to analyze these files...
ires1 system_i 1,{{ atsa finneganswake1.flac finneganswake.ats }} 
prints "\n***1st analyzed file is ready***\n\n"
ires2 system_i 1,{{ atsa beats.wav beats.ats }} 
prints "\n***2nd analyzed file is ready***\n\n"

instr 1
ipr ATSinfo "finneganswake.ats", 3                  ; get number of partials
prints "\n***number of partials = %d***\n\n", ipr

ktime1	line	0, p3, 12.67
ktime2	line	0, p3, 2
kline	line    0, p3, 1                            ; cross from voice to the beats
        ATSbufread ktime1, 1, "finneganswake.ats", ipr
aout	ATScross   ktime2, 1, "beats.ats", 1, kline, 1, ipr
	outs aout*1.7, aout*1.7

endin

</CsInstruments>
<CsScore>
; sine wave.
f 1 0 16384 10 1

i 1 0 12.7
e
</CsScore>
</CsoundSynthesizer>
