<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o Signum_Welsh.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; by tgrey - 2020

instr 1
        iFreq = p4
        iMode = p5

        ; generate a sine lfo @5hz
        kMod lfo 1, 5

        ; if p5 is non-zero, take the negative/positive sign of the lfo
        ; this squares off the lfo!
        if(iMode!=0) then
                kMod signum kMod
        endif

        ; gerate signal with modulation included
        aSig poscil kMod, iFreq

        outs aSig, aSig
endin

</CsInstruments>
<CsScore>
i1      0       .5      440 0
i1      +       .       550 0
i1      +       .       660     1 ; this event gets "squared" modulation due to non-zero p5
</CsScore>
</CsoundSynthesizer>