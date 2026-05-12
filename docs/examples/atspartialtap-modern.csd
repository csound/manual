<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc for RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o ATSpartialtap.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; by Menno Knevel - 2023

; default settings
res1:i = systemi(1, {{ atsa drumsMlp.wav drumsMlp1.ats }})
 ; longer hopsize & more cycles
res2:i = systemi(1, {{ atsa -h.8 -c8 drumsMlp.wav drumsMlp2.ats }})

instr 1 
  time:k = line(0, p3, 2)
  atsbufread(time, 1, p4 , 54)
  freq1:k, amp1:k = atspartialtap(5)
  freq2:k, amp2:k = atspartialtap(20)
  freq3:k, amp3:k = atspartialtap(30)

  out1:a = poscil(amp1, freq1, 1)
  out2:a = poscil(amp2, freq2, 1)
  out3:a = poscil(amp3, freq3, 1)
  Out:a = (out1 + out2 + out3)*10  ; amplify some more
  out(Out*p5, Out*p5)
endin

</CsInstruments>
<CsScore>
f 1 0 16384 10 1 0 .5 0 .33 ; square-ish wave
; stretch the drums...
i 1 0 2 "drumsMlp1.ats"    2.5 ; defaults settings for ATSA
i 1 3 10 "drumsMlp2.ats"   1   ; different settings
e
</CsScore>
</CsoundSynthesizer>