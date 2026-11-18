<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac      ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o NervousHappyBirthday_Cucchi.wav -W ;;; for file output any platform
; By Stefano Cucchi 2022
</CsOptions>
<CsInstruments> 

sr     = 48000  
ksmps  = 10    
nchnls = 2      
0dbfs  = 1     

instr 1
  ;                          MAX - MIN - JUMP
  Count@global:i = cntcreate(p4,   p5,   p6)
  readcount:k = cntread(Count)
  valcycles:k = cntcycles(Count)
  printk2(readcount) ; print the actual value
  printk2(valcycles) ; print "how many times" the counter has cycled
endin

instr 10  
  TrigFreq:k = randomi(0.57, 12, p4)
  Trigger:k = metro(TrigFreq)
  dur:i = 0.65
  function:i = p5
  schedkwhen(Trigger, 0, 20, 20, 0, dur, function)
endin

instr 20          
  pchndx:i = counti(Count)
  pch:i = table(pchndx, p4)
  env:a = expseg(1, p3, 0.001)
  sig:a = poscil(0.2 * env, cpspch(pch), 1)
  out(sig, sig)
endin

</CsInstruments>
<CsScore>
f 1 0 4096 10 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 
f 2 0 64 -2  7  7.00 7.00  7.02 7.00 7.05 7.04  7.00 7.00  7.02 7.00 7.07 7.05
f 3 0 64 -2  7  7.00 8.00  8.00 7.09 7.05 7.02  7.00 8.00  8.00 7.09 7.05 7.02
f 4 0 64 -2  7  7.10 7.10  7.09 7.05 7.07 7.05  7.10 7.10  7.09 7.05 7.07 7.05
         
i 1  0   10  12  0  1  ; play every note
i 1  5   5   12  0  2  ; one note YES and one note NO - JUMP = 2 
i 1  10  5   12  7  1  ; every note from position 7 to 12
i 1  15  10  12  0  1  ; play every note
i 10 0   20  24  2
i 10 12  12  21  3
i 10 13  20  11  4
e
</CsScore>
</CsoundSynthesizer> 