<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac    ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o opcode_f.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
0dbfs =  1
nchnls = 2

; example by Luis Salgueiro

opcode Transpose, a, afk    ; transpose a monophonic input signal through FFT.
 ain, fsig, kInterval xin
 fScaled pvscale fsig, semitone(kInterval)
 aTransposed pvsynth fScaled
 xout aTransposed 
endop

instr 1
 a1 diskin2 "fox.wav"
 fsig pvsanal a1, 1024, 256, 1024, 1
 aTransposed Transpose a1, fsig, p4   ; p4 = transposition in semitones
 outs aTransposed, aTransposed
endin

</CsInstruments>
<CsScore>
i1 0 3 0
i1 . . 7
i1 . . 12
</CsScore>
</CsoundSynthesizer>
