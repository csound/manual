<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o floor.wav -W ;;; for file output any platform

; By Stefano Cucchi 2024
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
0dbfs  = 1
nchnls = 2

instr 1

gkrandom randomh 1, 45, 300, 2,  3 ; generate some random numbers
gkrandomFLOOR = floor (gkrandom)   ; take the integer part
gkrandomFRAC = frac (gkrandom)     ; take the fractional part

endin

instr 10

  ktrigger metro 4
  kmintim = 0
  kmaxnum = 10
  kinsnum = 20
  kwhen = 0
  kdur = ktrigger*0.25
  schedkwhen ktrigger, kmintim, kmaxnum, kinsnum, kwhen, kdur
  
endin

instr 20

  irandomFLOOR = i(gkrandomFLOOR) 
  irandomFRAC = i(gkrandomFRAC)

  ; Use the integer part to control the number of harmonics of every note
  ; after converting (k) value to (i)
  prints "generated value = %f\n", i(gkrandom)
  prints "--> floor value = %d\n", irandomFLOOR
  a1 buzz 0.5, 120, irandomFLOOR, 1 
                            
  kenvelope linseg 0, p3*0.1, 1, p3*0.8, 1, p3*0.1, 0

  a1 = a1*kenvelope

  aL, aR pan2 a1, irandomFRAC, 1 ; use the fractional part to control the pan position 
  outs aL, aR
  
endin

</CsInstruments>
<CsScore>

f 1 0 16384 10 1

i 1 0 10
i 10 0 10 
e
</CsScore>
</CsoundSynthesizer>