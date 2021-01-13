<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    No messages
-odac   ;;;realtime audio in
; For Non-realtime ouput leave only the line below:
; -o sflooper.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; By  Menno Knevel - 2020

isf   sfload "07AcousticGuitar.sf2"
      sfpassign 0, isf

instr 1	

inum  = p4
ivel  = p5
kamp  linsegr 1,1,1,.1,0	; declick envelope
kamp  = kamp * .0000015		;scale amplitude (= kamp/5000)
kfreq = 1			;do not change freq from sf
;"07AcousticGuitar.sf2" contains 2 samples, on notes E1 and C#4
;start loop from beginning, loop .2 seconds - on the root key of these samples
aL,aR sflooper ivel, inum, kamp*ivel, kfreq, 0, 0, .2, .05  ; make amp velocity dependent
      outs aL, aR

endin
</CsInstruments>
<CsScore>

i1 0 1 60 120
i1 + 1 62 <
i1 + 1 65 <
i1 + 1 69 10
e
</CsScore>
</CsoundSynthesizer>
