<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
-d        ;;;no display
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o adsr-group.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; by Menno Knevel - 2021

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

; both amplitude and filter use same ADSR curves 
instr 1                  
  env:k = adsr(0.01, 0.5, 0.5, p4)         ; linear envelope 
  sig:a = vco2(env, 110)                   ; A+D+S+R = p3  
  sig = rezzy(sig, 500 + env*1000, 10)     ; same curve but scaled 
  outs(sig, sig)       
endin

instr 2 ; midi behavior                  
  env:k = madsr(0.01, 0.5, 0.5, p4)        ; linear envelope
  sig:a = vco2(env, 110)                   ; A+D+S = p3, then go into Release stage                
  sig = rezzy(sig, 500 + env*1000, 10)     ; same curve but scaled  
  outs(sig, sig)                      
endin

instr 3                  
  env:k = xadsr(0.01, 0.5 , 0.5, p4)       ; exponential envelope
  sig:a = vco2(env, 110)                   ; A+D+S+R = p3   
  sig = rezzy(sig, 500 + env*1000, 10)     ; same curve but scaled 
  outs(sig, sig)
endin

instr 4 ; midi behavior          
  env:k = mxadsr(0.01, 0.5 , 0.5, p4)      ; exponential envelope
  sig:a = vco2(env, 110)                   ; A+D+S = p3, then go into Release stage         
  sig = rezzy(sig, 500 + env*1000, 10)     ; same curve but scaled 
  outs(sig, sig)                      
endin

</CsInstruments>
<CsScore>
s
i1 1 2 .01      ; same notes for everyone!
i1 5 . .5
i1 9 . 1.5
s
i2 1 2 .01
i2 5 . .5
i2 9 . 1.5
s
i3 1 2 .01
i3 5 . .5
i3 9 . 1.5
s
i4 1 2 .01
i4 5 . .5
i4 9 . 1.5
e
</CsScore>
</CsoundSynthesizer>