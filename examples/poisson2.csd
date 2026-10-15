<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o poisson2.wav -W ;;; for file output any platform

; By Stefano Cucchi - 2024
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1024
nchnls = 2
0dbfs  = 1

instr 1

kpitch poisson p4
printk (ksmps/sr),kpitch ;prints every k-period

a1 oscili 0.3, kpitch, 1
outs a1, a1

endin

</CsInstruments>
<CsScore>

f1 0 4096 10 1 0.1 0 0.2 0 0.3 0 0.1

i 1 0 5 100
i 1 + 5 200
e
</CsScore>
</CsoundSynthesizer>