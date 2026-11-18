<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
;-o BuzzFof_Cucchi.wav -W ;;; for file output any platform


; By Stefano Cucchi - 2022

</CsOptions>
<CsInstruments>

sr = 48000
ksmps = 10 
nchnls = 2
0dbfs  = 1

rev1L@global:a = init(0)
rev1R@global:a = init(0)

instr buzz
  dur:i = p3
  DensInit:i = p4  ; Initial bouncing density
  DensFinal:i = p5 ; Final bouncing density
 
  fe1:k = expseg(DensInit, dur, DensFinal)
 
  ftndx:k = linseg(0, dur*0.2, 1, dur*0.2, 0, dur*0.6, 1)
  resfn:i = 2
  ftfn:i = 1
  ftmorf(ftndx, ftfn, resfn)
  env:k = expseg(0.0001, p11, p8, dur-p11-p12, p8, p12, 0.0001)
 
  sig:a = buzz(env, fe1, sr/(2*fe1), 2)
  freqformant:k = expseg(p6, dur, p7)
  form:a = fofilter(sig, freqformant, 0.007, 0.04)
 

  filtergain:i = 0.015
  eq:a = pareq(form, freqformant, filtergain, 0.1, 0)
 
  randompan:k = randi(0.5, 4, p9)
  randompan += 0.5

  aL, aR = pan2(eq*16, randompan)

  outch(1, aL)
  outch(2, aR)
 
  Delay1:a = delay(aL, 0.2)
  Delay2:a = delay(aR, 0.36)
 
  outch(1, Delay2*0.01)
  outch(2, Delay1*0.01)

  rev1L += aR * p10
  rev1R += aL * p10
endin


instr fof
  dur:i = p3
  freq1:i = cpspch (p4)
  freq2:i = cpspch (p5)
  freq3:i = cpspch (p6)
  freq4:i = cpspch (p7)
  freq:k = expseg(freq1, dur*p8, freq2, dur*p9, freq3, dur*p10, freq4)
 
  amp:i = 0.99

  random1:k = randomi(-3, 3, 4)
  random2:k = randomi(-30, 30, 8)
  Jitter1:k = jitter(2, 0.2, 5)
  form1:k = p11 + random1
  oct1:k = 2
  band1:k = p12 + random2
  ris1:k = 0.003
  dur1:k = 0.12
  dec1:k = 0.007
  olaps1:i = 1900
  fna1:i = 15

  random3:k = randomi(-2, 2.2, 3.8)
  random4:k = randomi(-25, 26, 2.6)
  Jitter2:k = jitter(3, 0.2, 3)
  form2:k = p13 + random3
  oct2:k = 2
  band2:k = p14 + random4
  ris2:k = 0.0003
  dur2:k = 0.012
  dec2:k = 0.07
  olaps2:i = 1700
  fna2:i = 16

  fnb:i = 18
  totdur:i = 800

  Fof1:a = fof(amp, freq+Jitter1, form1, oct1, band1, ris1, dur1, dec1, \
               olaps1, fna1, fnb, totdur)
  Fof2:a = fof(amp*0.9, (freq*2.01)+Jitter2, form2, oct2, band2, ris2, \
               dur2, dec2, olaps2, fna2, fnb, totdur)
 
  Env:k = expseg(0.0001, p15, p16, dur-p15-p17, p16, p17, 0.0001)

  somma:a = (Fof1 + Fof2*0.72) * Env
  somma = dam(somma, 0.7, 1.2, 0.8, 0.001, 0.2)
  somma *= 2.9
  delaytime:a = randomi(0.01, 0.5, 4)
  sommadel:a = vdelay(somma, delaytime, 0.6)
 
  Pan:i = p18

  outch(1, somma * (1-Pan))
  outch(2, sommadel * Pan)

  rev1L += somma*0.3
  rev1R += sommadel*0.3
endin


instr 100 ; REV

  time1:k = randomi(2.3, 3.6, 6)
  time2:k = randomi(2.2, 3.7, 7)

  arev1L = reverb2(rev1L, time1, 0.1)
  arev1R = reverb2(rev1R, time2, 0.8)

  timedelay1:a = randomi(0.3, 0.4, 5)
  timedelay2:a = randomi(0.3, 0.4, 8)
  arev2L = vdelay(arev1L, timedelay1, 0.6)
  arev2R = vdelay(arev1R, timedelay2, 0.6)

  totL:a = (arev1L*0.12) + (arev2R*0.34)
  totR:a = (arev1R*0.12) + (arev2L*0.34)

  random1:k = randomi(0.25, 0.41, 8)
  random2:k = randomi(0.23, 0.39, 7)

  outch(1, totL*random1)
  outch(2, totR*random2)

  clear(rev1L)
  clear(rev1R) 
endin

</CsInstruments>
<CsScore>

t 0 60 20 46 20 35; TEMPO

; function - "buzz1";
f1 0 2 -2 3 4
f2 0 4097 10 1 /*contents of f2 dont matter */
f3 0 4096 10 1
f4 0 4097 10 1 0 1 0 1 0 1 0 1 1 1

; function - buzz2
f6 0 4096 10 1 0.5 0.9


; functions - fof1
f 15 0 4096 10 1 0 1 0 1 0 1   
f 16 0 4096 10 1 0 1 0 0  1    
; sigmoid wave
f 18 0 1024 19 0.5 0.5 270 0.5 


;REVERB
i 100 0 53;


;                 dens    dens  form   form      vol      pan      REV     rAttack Decay
i "buzz" 0   5    2      120  1200    200       0.1      0.11     0.1       0.2    2
i "buzz" 2   8    1      34   450     12200     0.11     0.6       0.3      0.01   2
i "buzz" 4   6    20     5    500     4600      0.12     0.1       0.5      0.1    2
i "buzz" 8   9    43     680  15500   300      0.092    0.4       0.01      0.1    2


i "buzz" 19  15    4     120   14200   200       0.12    0.15      0.9      0.01   3
i "buzz" 21  13    3.8   35    2000    14200     0.09    0.49      0.3      0.01   3
   

i "buzz" 35  2    611    2  4000    4012      0.013     0.9       0.81      0.1   3
i "buzz" 35  2    40     43   1000   112       0.02      0.1       0.1      0.1   3

i "buzz" 39 2     20     27   3000    300      0.4       0.4       0.3      0.4   3
i "buzz" 39 2      4     72   79      5112     0.14      0.1       0.3      0.8   3
   
i "buzz" 42  6    11     49   50      1112      0.1      0.3       0.1      2.5   2
i "buzz" 42  9     2     812  100     4112     0.12      0.7       0.45     3.7  4
 

;                  Pitch1   Pitch2  Pitch3   Pitch4 -  portamenti(somma = 1)-Form1  Band1  Form2  Band2  Att    VOl  Rel   Pan
i "fof" 0     13   4.01    6.01    4.01     3.05       0.15   0.35  0.50     500   200     890    59    7.31   0.21  4.3  0.2
i "fof" 0     14   4.09    3.08    5.03     4.11       0.35   0.50  0.25     600   200     700    59    6.31   0.21  5.3  0.99


i "fof" 50   10    5.09    6.08    7.08     4.08      0.40   0.20  0.40      6230  720      2700   85   4.01   0.02 3.03  0.01
i "fof" 50.05 10   5.09    6.08    7.08     4.08      0.40   0.20  0.40      4230  420      1700   15   4.01   0.03 4.03  0.67

i "fof" 51    10   5.09    6.03    7.02     4.11      0.40   0.20  0.40      2300   720     5700   859  4.01   0.01 3.03  0.78
i "fof" 51.03 10   5.09    6.03    7.02     4.11      0.40   0.20  0.40      2300   720     5700   859  4.6    0.01 3.03  0.23

e 2

</CsScore>
</CsoundSynthesizer>