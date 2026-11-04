<CsoundSynthesizer>
<CsOptions>
;-n 
-odac -d
</CsOptions>
<CsInstruments>
;
;               GRANULAR SYNTHESIS
;              --------------------
;                   Ver 2.1
;               Eugenio Giordani
;
;
;-----------------------------------------------------------------------------------
;this csd implements the Granular Synthesis based on the model proposed by B. Truax.
;
;--------------- ORCHESTRA HEADER -------------------
;NOTE: for a better audio quality ksmps = 1
;
sr = 44100
ksmps  = 2
nchnls = 2
0dbfs  = 1
;---------------- Global control variables initialization -------------
;
dur@global:k    = init(0)  ;average grain duration
durr@global:k   = init(0)  ;grain duration random variation
del@global:k    = init(0)  ;average grain delay
delr@global:k   = init(0)  ;grain delay random variation
ramp@global:k   = init(0)  ;ramp ratio
freq@global:k   = init(0)  ;audio signal average frequency
freqr@global:k  = init(0)  ;audio signal frequency random variation
phase@global:k  = init(0)  ;audio signal phase
phaser@global:k = init(0)  ;audio signal phase random variation
amp@global:k    = init(0)  ;global amplitude
ran@global:k    = init(0)  ;instant random frequency
rnd1@global:k   = init(0)  ;instant grain random duration  (VOICE #1)
rnd2@global:k   = init(0)  ;                               (VOICE #2)
rnd3@global:k   = init(0)  ;                               (VOICE #3)
rnd4@global:k   = init(0)  ;                               (VOICE #4)
rnd1y@global:k  = init(0)  ;instant grain random delay     (VOICE #1)
rnd2y@global:k  = init(0)  ;                               (VOICE #2)
rnd3y@global:k  = init(0)  ;                               (VOICE #3)
rnd4y@global:k  = init(0)  ;                               (VOICE #4)
rnd1p@global:k  = init(0)  ;instant grain random phase     (VOICE #1)
rnd2p@global:k  = init(0)  ;                               (VOICE #2)
rnd3p@global:k  = init(0)  ;                               (VOICE #3)
rnd4p@global:k  = init(0)  ;                               (VOICE #4)

;=========== GRAIN GENERATOR (VOICE #1) =============
instr 1
  ifun = p4    ;audio function
  ;
  ;       Update of grain parameters (re-initialisation)
  ;       ----------------------------------------------
loop:
  idur    = i(dur)                      ;the ... values are sampled
                                        ;by the corresponding generator in instr 11
                                        ;and converted in type i var
  idurr   = i (rnd1)
  itrpz   = abs(0.001* (idur + idurr))  ;calculates the duration of the trapezoid
  iramp   = i(ramp) + 0.1               ;plus magic number
  idel    = i(del)
  idelr   = i(rnd1y)
  idely   = abs(0.001 * (idel + idelr)) ;calculate the total delay
  ifreq   = i(freq)
  ifreqr  = i(ran)
  iphase  = i(phase)
  iphaser = i(rnd1p)
  iamp    = i(amp)
  irise   = itrpz/iramp               ;calculates the attack time of the trapezoid
  isus    = itrpz - (2 * irise)       ;calculates the sustain duration of the trapezoid
  igrain  = itrpz + idely             ;calculates the duration trapezoid+delay
  iph     = abs(iphase + iphaser)     ;calculates the final phase
  ifq     = ifreq + ifreqr            ;calculates the final frequency
  ;------------ Interrupt simulation section (interruption) -------------------
  ;
  ;The timout opcode works as a interrupt generator. Timout is loaded
  ;with the current duration of the grain and decremented automatically until zero
  timout(0, igrain, cont)    ;if the counter value is different from zero go to cont
  reinit(loop)               ;or go to the reinitialization
cont:
  k1 = linseg(0, irise, iamp, isus, iamp, irise, 0, idel, 0) ;generates grain envelop
  a1@global:a = oscili(k1, ifq, ifun, iph)                   ;generates voice 1
  printk(0.1, k(a1))
  a2@global:a = init(0)
  a3@global:a = init(0)
  a4@global:a = init(0)
endin

;=========== GRAIN GENERATOR (VOICE #2) =============
instr 2
  ifun = p4    ;audio function
  ;
  ;       Update of grain parameters (re-initialisation)
  ;       ----------------------------------------------
loop:
  idur    = i(dur)                      ;the ... values are sampled
                                        ;by the corresponding generator in instr 11
                                        ;and converted in type i var
  idurr   = i (rnd2)
  itrpz   = abs(0.001* (idur + idurr))  ;calculates the duration of the trapezoid
  iramp   = i(ramp) + 0.1               ;plus magic number
  idel    = i(del)
  idelr   = i(rnd2y)
  idely   = abs(0.001 * (idel + idelr)) ;calculate the total delay
  ifreq   = i(freq)
  ifreqr  = i(ran)
  iphase  = i(phase)
  iphaser  = i(rnd2p)
  iamp    = i(amp)
  irise   = itrpz/iramp               ;calculates the attack time of the trapezoid
  isus    = itrpz - (2 * irise)       ;calculates the sustain duration of the trapezoid
  igrain  = itrpz + idely             ;calculates the duration trapezoid+delay
  iph     = abs(iphase + iphaser)     ;calculates the final phase
  ifq     = ifreq + ifreqr            ;calculates the final frequency
  ;------------ Interrupt simulation section (interruption) -------------------
  ;
  ;The timout opcode works as a interrupt generator. Timout is loaded
  ;with the current duration of the grain and decremented automatically until zero
  timout(0, igrain, cont)    ;if the counter value is different from zero go to cont
  reinit(loop)               ;or go to the reinitialization
cont:
  k1 = linseg(0, irise, iamp, isus, iamp, irise, 0, idel, 0) ;generates grain envelop
  a2 = oscili(k1, ifq, ifun, iph)                            ;generates voice 2
endin

;=========== GRAIN GENERATOR (VOICE #3) =============
instr 3
  ifun = p4    ;audio function
  ;
  ;       Update of grain parameters (re-initialisation)
  ;       ----------------------------------------------
loop:
  idur    = i(dur)                      ;the ... values are sampled
                                        ;by the corresponding generator in instr 11
                                        ;and converted in type i var
  idurr   = i (rnd3)
  itrpz   = abs(0.001* (idur + idurr))  ;calculates the duration of the trapezoid
  iramp   = i(ramp) + 0.1               ;plus magic number
  idel    = i(del)
  idelr   = i(rnd3y)
  idely   = abs(0.001 * (idel + idelr)) ;calculate the total delay
  ifreq   = i(freq)
  ifreqr  = i(ran)
  iphase  = i(phase)
  iphaser  = i(rnd3p)
  iamp    = i(amp)
  irise   = itrpz/iramp                ;calculates the attack time of the trapezoid
  isus    = itrpz - (2 * irise)        ;calculates the sustain duration of the trapezoid
  igrain  = itrpz + idely              ;calculates the duration trapezoid+delay
  iph     = abs(iphase + iphaser)      ;calculates the final phase
  ifq     = ifreq + ifreqr             ;calculates the final frequency
  ;------------ Interrupt simulation section (interruption) -------------------
  ;
  ;The timout opcode works as a interrupt generator. Timout is loaded
  ;with the current duration of the grain and decremented automatically until zero
  timout(0, igrain, cont)    ;if the counter value is different from zero go to cont
  reinit(loop)               ;or go to the reinitialization
cont:
  k1 = linseg(0, irise, iamp, isus, iamp, irise, 0, idel, 0) ;generates grain envelop
  a3 = oscili(k1, ifq, ifun, iph)                            ;generates voice 3
endin

;=========== GRAIN GENERATOR (VOICE #4) =============
instr 4
  ifun = p4    ;audio function
  ;
  ;       Update of grain parameters (re-initialisation)
  ;       ----------------------------------------------
loop:
  idur    = i(dur)                      ;the ... values are sampled
                                        ;by the corresponding generator in instr 11
                                        ;and converted in type i var
  idurr   = i (rnd4)
  itrpz   = abs(0.001* (idur + idurr))  ;calculates the duration of the trapezoid
  iramp   = i(ramp) + 0.1               ;plus magic number
  idel    = i(del)
  idelr   = i(rnd4y)
  idely   = abs(0.001 * (idel + idelr)) ;calculate the total delay
  ifreq   = i(freq)
  ifreqr  = i(ran)
  iphase  = i(phase)
  iphaser  = i(rnd4p)
  iamp    = i(amp)
  irise   = itrpz/iramp               ;calculates the attack time of the trapezoid
  isus    = itrpz - (2 * irise)       ;calculates the sustain duration of the trapezoid
  igrain  = itrpz + idely             ;calculates the duration trapezoid+delay
  iph     = abs(iphase + iphaser)     ;calculates the final phase
  ifq     = ifreq + ifreqr            ;calculates the final frequency
  ;------------ Interrupt simulation section (interruption) -------------------
  ;
  ;The timout opcode works as a interrupt generator. Timout is loaded
  ;with the current duration of the grain and decremented automatically until zero
  timout(0, igrain, cont)    ;if the counter value is different from zero go to cont
  reinit(loop)               ;or go to the reinitialization
cont:
  k1 = linseg(0, irise, iamp, isus, iamp, irise, 0, idel, 0) ;generates grain envelop
  a4 = oscili(k1, ifq, ifun, iph)                            ;generates voice 4
endin

;=========== GRAIN CONTROLLER =============
instr 11
 
  dur    = oscil1(0,1, p3, p4)      ;control generator for  idur
  printk(0.1, dur)
  durr   = oscil1(0,1, p3, p5)      ;                       idurr
  del    = oscil1(0,1, p3, p6)      ;                       idel
  delr   = oscil1(0,1, p3, p7)      ;                       idelr
  ramp   = oscil1(0,1, p3, p8)      ;                       iramp
  freq   = oscil1(0,1, p3, p9)      ;                       ifreq
  freqr  = oscil1(0,1, p3, p10)     ;                       ifreqr
  phase  = oscil1(0,1, p3, p11)     ;                       iphase
  phaser = oscil1(0,1, p3, p12)     ;                       iphaser
  amp    = oscil1(0,1, p3, p13)     ;                       iamp
  krnd1  = rand(1, 0.1)             ;random generator   (VOICE #1)
  krnd2  = rand(1, 0.9)             ;                   (VOICE #2)
  krnd3  = rand(1, 0.5)             ;                   (VOICE #3)
  krnd4  = rand(1, 0.3)             ;                   (VOICE #4)
  ;the instantaneous values of the random generators are rescaled to obtain
  ;the appropriate values of frequency, duration, delay, and phase
  ran   = krnd1 * freqr/2 ;rescale freq random variation       (VOICE #1,2,3,4)
  rnd1  = krnd1 * durr/2  ;rescale duration random variation         (VOICE #1)
  rnd2  = krnd2 * durr/2  ;                                          (VOICE #2)
  rnd3  = krnd3 * durr/2  ;                                          (VOICE #3)
  rnd4  = krnd4 * durr/2  ;                                          (VOICE #4)
  rnd1y = krnd1 * (0.05 + delr /2) ;rescale delay random variation   (VOICE #1)
  rnd2y = krnd2 * (0.05 + delr /2) ;                                 (VOICE #2)
  rnd3y = krnd3 * (0.05 + delr /2) ;                                 (VOICE #3)
  rnd4y = krnd4 * (0.05 + delr /2) ;                                 (VOICE #4)
  rnd1p = krnd1 * phaser/2         ;rescale phase random variation 
  rnd2p = krnd2 * phaser/2         ;
  rnd3p = krnd3 * phaser/2         ; 
  rnd4p = krnd4 * phaser/2         ;
endin

;=========================== RESCALE, MIX & OUT ================================
instr 21
  iscale = p4                    ;reads the scale factor from the score
  outs1((a1/2 + a2/2) * iscale)  ;sends the voices 1 and 2 to output
  outs2((a3/2 + a4/2) * iscale)  ;sends the voices 3 and 4 to output
endin
</CsInstruments>
<CsScore>
;gsc4.sco
;
;-------- Control function for grain duration --------
;
f11 0 512 -7 10 256 20 128 20  128 16
;-------- Control function for random duration variation --------
;
f12 0 512 -7 4 256 1 256 0
;-------- Control function for grain delay --------
;
f13 0 512 -7 10 256 20 256 5
;-------- Control function for random delay variation --------
;
f14 0 512 -7 0 128 0 256 2 128 0
;-------- Control function for ramp ratio --------
;
f15 0 512 -7 2 256 4 256 2
;-------- Control function for frequency --------
;
;f16  0 512 -7 1.345 512 3.345
f16   0 512 -7 220 512 220
;-------- Control function for random frequency variation --------
;
f17 0 512 -7 0 512 110
;-------- Control function for phase (or Pointer to audio file) --------
;
f18 0 512 -7 0 512 0
;-------- Control function for random phase variation --------
f19 0 512 -7 0 128 1 256 0 128 0
;-------- Control function for total amplitude --------
;
f20 0 512 7 0 128 1 256 1 128 0
;================= Audio Functions =====================
;f1  0   0 -1  "density.wav"   0   0   0
f1 0 1024 10 0.6 0.8 1 0.5 0.3 0.5 0.7
;===========================================================
;p1 p2  p3  p4 
;-----------------------------------------------------------
;           ifun
i1  0   40  1
i2  +   40  1
i3  +   40  1
i4  +   40  1
;-------------------------------------------------------------------------------
;           dur  durr del delr ramp  freq  freqr  phase phaser  amp
i11 0   40  11   12   13  14   15    16    17     18    19      20 
;-------------------------------------------------------------------------------
;           scale
i21 0   40  .61
;f0 z
e
</CsScore>
</CsoundSynthesizer>