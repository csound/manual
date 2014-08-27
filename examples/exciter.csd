<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac   ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o moogvcf.wav -W ;;; for file output any platform
</CsOptions>

<CsInstruments>
sr=44100
ksmps=1
nchnls=2
0dbfs=1

instr 1 ; original sound
  a1 diskin2 "beats.wav", 1, 0, 1
                ;freq, ceiling, drive and blend
  a2 exciter a1, 3000, 15000, 5, -5
     outs     a1, a1
endin

instr 2 ; excited sound + original sound
  a1 diskin2 "beats.wav", 1, 0, 1
                ;freq, ceiling, ceiling_active, blend and drive
  a2 exciter a1, 3000, 15000, 5, -5
     outs     a2+a1, a2+a1
endin

instr 3 ; excited sound only
  a1 diskin2 "beats.wav", 1, 0, 1
                ;freq, ceiling, ceiling_active, blend and drive
  a2 exciter a1, 3000, 15000, 5, -5
     outs     a2, a2
endin
</CsInstruments>

<CsScore>
i3 0 6
i2 7 6
i1 14 6
e
</CsScore>

</CsoundSynthesizer>
