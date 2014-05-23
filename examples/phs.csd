<CsoundSynthesizer>
<CsOptions>
-d -o dac
</CsOptions>
<CsInstruments>
/* ksmps needs to be an integer div of
   hopsize */
ksmps = 64

instr 1

 ihopsize = 256  ; hopsize
 ifftsize = 2048 ; FFT size 
 iolaps = ifftsize/ihopsize ; overlaps
 ibw = sr/ifftsize ; bin bandwidth
 kcnt init 0    ; counting vars
 krow init 0

 kOla[] init ifftsize ; overlap-add buffer
 kIn[] init ifftsize  ; input buffer
 kOlph[] init ifftsize/2+1 ; old phases
 kPhs[] init ifftsize/2+1 ; synthesis phases
 kDeltaOut[] init ifftsize/2+1 ; synthesis freqs
 kMagsOut[] init ifftsize/2+1 ; synthesis mags
 kOut[][] init iolaps, ifftsize ; output buffers

 a1 diskin2 "fox.wav",1,0,1 ; audio input

 /* every hopsize samples */
 if kcnt == ihopsize then  
   /* window and take FFT */
   kWin[] window kIn,krow*ihopsize
   kSpec[] rfft kWin
   
  /* mags & phases */
  kMags[] mags kSpec 
  kPha[] phs kSpec
  
  /* phase diffs */
  kDelta[] = kPha - kOlph 
  kOlph = kPha
  
  /* pitch shift */
  ki = 0
  iscal = 1.25 ; maj 3rd up
  until ki == ifftsize/2 do
   if ki*iscal < ifftsize/2 then
     kDeltaOut[ki*iscal] = kDelta[ki]*iscal
     kMagsOut[ki*iscal] = kMags[ki]
   endif
    ki += 1
  od
  
  /* accum phases */
   kPhs = kDeltaOut + kPhs 
   kSpec pol2rect kMagsOut,kPhs
   
   /* IFFT + window */
   kRow[] irfft kSpec
   kWin window kRow, krow*ihopsize
   /* place it on out buffer */
   kOut setrow kWin, krow

   /* zero the ola buffer */
   kOla = 0
   /* overlap-add */
   ki = 0
   until ki == iolaps do
     kRow getrow kOut, ki
     kOla = kOla + kRow
     ki += 1
   od
  
  /* update counters */ 
  krow = (krow+1)%iolaps
  kcnt = 0
 endif

 /* shift audio in/out of buffers */
 kIn shiftin a1
 a2 shiftout kOla
 a1 delay a1, (ifftsize+ihopsize)/sr
    out a1*0.3+a2/iolaps

 /* increment counter */
 kcnt += ksmps

endin

</CsInstruments>
<CsScore>
i1 0 10
</CsScore>
</CsoundSynthesizer>


