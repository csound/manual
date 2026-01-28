<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o atsread.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; by Menno Knevel - 2021

res:i = systemi(1, {{ atsa fox.wav fox.ats }}) ; default settings

instr 1 
  time:k = line(0, p3, 2)
  freq:k, amp:k = atsread(time, "fox.ats", 10) ; take the 10th partial
  env:a = linen(1, 0, p3, 0.1)    ; envelope to avoid clicks
  Out:a = oscili(0.8, freq, 1)
  out(Out*env, Out*env)
endin

</CsInstruments>
<CsScore>
f 1 0 16384 10 1 ;sine wave.

i 1 0 1         ; fast speed
i 1 2 2         ; normal
i 1 5 10        ; 5x slower 
e
</CsScore>
</CsoundSynthesizer>