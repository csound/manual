<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o randc.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; by Menno Knevel - 2024

instr 1 ;same values every time

krnd randc 100, 10
     printk .5, krnd                    ; look 
aout oscili 0.8, 440+krnd               ; & listen
     outs aout, aout

endin

instr 2 ;different values every time

krnd randc 100, 10, 10                  ; seed from system clock
     printk .5, krnd                    ; look 
aout oscili 0.8, 440+krnd               ; & listen
     outs aout, aout

endin
</CsInstruments>
<CsScore>
i 1 0 3
i 2 4 3
e
</CsScore>
</CsoundSynthesizer>