<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o turnoff2.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr      = 44100    ;samples per second for sound
ksmps   = 32
nchnls  = 2
0dbfs   = 1

; example by Lou Cohen

sine@global:i = ftgen(1, 0, 131073, 9, 1, 1, 0)                ;single sine tone

;-----------------------------------------
instr 2 ;start
  Trigger:k = init(0)
  if Trigger == 0 then
    Multiple:k = 1.1
    Hz:k = 440
    Amp:k = (0dbfs/10)
    ;startup four instances of instrument 200
    event("i", 200, 0, 3000, Amp, Hz)
    Amp *= 0.75
    Hz *= Multiple
    event("i", 200, 0, 3000, Amp, Hz)
    Amp *= 0.75
    Hz *= Multiple
    event("i", 200, 0, 3000, Amp, Hz)
    Amp *= 0.75
    Hz *= Multiple
    event("i", 200, 0, 3000, Amp, Hz)
    Amp *= 0.75
    Hz *= Multiple
    Trigger = 1
  endif
endin
;---------------------------------------------
instr 3 ;after 10 seconds, turn off the instruments
  Trigger:k = init(1)
  if Trigger ==1 then
    turnoff2(200, 1, 1)       ;turn off most recently started instrument instance
    Active:k = active(200)    ;find out how many are still active
    printk2(Active)           ;print mainly to show progress
    turnoff2(200, 0, 1)       ;turn off all the rest of the instruments
    Active = active(200)      ;find out how many are still active
    printk2(Active, 10)       ;print to show progress
  endif
endin
;----------------------------------------------------
instr 200 ;play the tone
  Env:k = linen(1, 0.1, p3, 0.1)
  ar = oscil(Env*p4, p5, sine)
  out(ar, ar)
  print(p4, p5)
endin
</CsInstruments>
<CsScore>
i2 0 0.1 
i3 10 0.1
</CsScore>
</CsoundSynthesizer>