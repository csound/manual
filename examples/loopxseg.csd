<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    No messages
-odac           -iadc     -d     ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o loopxseg.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
kr = 4410
ksmps = 10
nchnls = 2
0dbfs  = 1

; Instrument #1
instr 1
  kfreq line 1, p3, 20
  kval  = p4		; value of second segment
  klp loopxseg kfreq, 0, 0, 0, 0, kval, 1, 1, 0

  a1 poscil3 klp, 440, 1
  out a1,a1
endin


</CsInstruments>
<CsScore>

; Table #1, a sine wave.
f 1 0 16384 10 1

; Play Instrument #1 for five seconds.
i 1 0 5 .05
i 1 6 5 .5
e


</CsScore>
</CsoundSynthesizer>
