<CsoundSynthesizer>
<CsOptions>
-odac -d -A -m0 -+msg_color=0
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1.0
seed 0

garev1 init 0
garev2 init 0
gktime init 0

alwayson 99 ;; reverb


instr 1 ;make chord
 
  iamp = p4
  ifm = p5
  itime = p6 ;phasor time
  ifreq1 = p7
  ifreq2 = p8
  iint1 = p9
  iint2 = p10
  innotes = p11 ;number of notes in chord
   
  kfm randomi ifm, ifm*1.05, 1
  km metro kfm
  kdur = 1/kfm
  
  afreq phasor 1/itime
  gkfreq downsamp (ifreq1+afreq*(ifreq2-ifreq1))
  printks "\n freq: %.2f", 1, gkfreq

  ;;                   p1  p2  p3  p4    p5     p6      p7
  schedkwhen km, 0, 0, 10, 0, kfm, iamp, iint1, iint2, innotes
  
endin


instr 10; vibes

  indx init 0
  incr = 1
  imax = p7-1
  iamp = db(p4)

  ifreq = i(gkfreq)
  
  loopit:
    
    iint=round(random(p5, p6))
    iint=(indx>0?iint:0)
    iffactor = 2^((iint)/12)
    
    ifreq = ifreq * iffactor
    iamp random iamp, iamp*1.05
    schedule 11, 0, p3, iamp, ifreq, iffactor, iint
    ;;print ifreq, iffactor, indx
    loop_le indx, incr, imax, loopit
    
   prints "\n "
    
endin

instr 11
  
  iamp = p4
  ifreq = p5
  ifactor = p6
  iint = p7
  ifreq = ifreq * ifactor
  ihrd random 0.1, 0.9
  ipos random 0.0, 1
  imp = 1
  kvibf = 6.0
  kvamp = 0.05
  ivibfn = 2
  idec = 0.1

  ares vibes iamp, ifreq, ihrd, ipos, imp, kvibf, kvamp, ivibfn, idec

  ;;
  if nchnls == 2 then 
    irpan random 0, 1
    aout1, aout2 pan2 ares, irpan
    
      ich2 = (nchnls == 2 ? 2: 3)
      outch 1, aout1
      outch ich2, aout2
    else

      irpan random 1, nchnls

      ichn = round(irpan)
      outch ichn, ares
      
    endif

  ;;send to reverb
  irsend random 0.2, 0.4
  garev1 += irsend * aout1
  garev2 += irsend * aout2
  
 prints " %.2f: %.2f int: %.2f", gktime, ifreq, iint
  
endin

instr 99 ;;; reverb
  gktime timeinsts
  arev1, arev2 reverbsc garev1, garev2, 0.85, sr/2
    ich1 = (nchnls == 2 ? 1: 7)
    ich2 = (nchnls == 2 ? 2: 8)
  outch ich1, arev1
  outch ich2, arev2
  clear garev1, garev2
endin

</CsInstruments>
<CsScore>
; Table #1, the "marmstk1.wav" audio file.
f 1 0 256 1 "marmstk1.wav" 0 0 0
; Table #2, a sine wave for the vibrato.
f 2 0 128 10 1
;;        
;        amp[dB]  metro[Hz] phasor[s]  freq1 freq2  int1 int2 nnotes
i1 0  20   -15      5         1         110   110    5    5    4 
i1 +  10   -15      .         1         55    220    4    5    6 
i1 30 10   -15      .         10        220   220    4    4    2 
i1 +  10   -15      .         10        220   220    3    5    3 
i1 +  20   -18      .         20        220   55     2    8    7 
i1 +  10   -12      2         10        55    55     3    5    3
i1 71 30   -9       6         30        330   330    2    3    2 
i1 +  10   -18      6         10        330   330    1    4    5
i1 +  9    -18      2         10        30    20     4    8    6

e

</CsScore>
</CsoundSynthesizer>