<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o signum.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; by tgrey - 2020

sr     =    44100
ksmps  =    10
nchnls =    2
0dbfs  =    1

instr 1
        iinput = p4
        isignum = signum(iinput)
        print iinput
        print isignum
endin

</CsInstruments>
<CsScore>
i1 0 .1 100
i1 + . 50
i1 + . .25
i1 + . 0
i1 + . -.25
i1 + . -50
i1 + . -100
</CsScore>
</CsoundSynthesizer>