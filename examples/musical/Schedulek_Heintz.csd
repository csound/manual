<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac      ;;;realtime audio out
-m128      ;;;reduce console output
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o Schedulek_Heintz.wav -W ;;; for file output any platform

; by joachim heintz 2024

</CsOptions>
<CsInstruments>

sr = 48000
ksmps   = 64
nchnls = 2
0dbfs   = 1
seed 0

opcode RndHarm,i[],iop
   //generates an array with iLen random numbers
   iLen,iMin,iMax xin //defaults to iMin=0 and iMax=1
   iOut[] init iLen
   indx = 0
   while (indx<iLen) do
     iOut[indx] = random:i(iMin,iMax)
     indx += 1
   od
   xout iOut
endop


instr GenerateSpectrum
   iHarmonics[] = RndHarm(p4)
   giSound = ftgen(0,0,4096,10,iHarmonics)
endin
schedule("GenerateSpectrum",0,0,4)

instr Call
   iStartPitch = 80 //MIDI note number
   kPitch init iStartPitch
   kStep init 3
   kNoteCount init 0
   kTrigMaxFreq init 3
   kTrigFreq init 2
   kPan init 0.9
   kNumHarm init 4
   kCycleCount init 1
   if (metro:k(kTrigFreq) == 1) then
     // call instrument
     schedulek("Play",0,kCycleCount/kTrigMaxFreq,kPitch,kPan)
     // update values
     kTrigFreq = random:k(kTrigMaxFreq/2,kTrigMaxFreq)
     kNoteCount += 1
     kPan -= 0.8/7
     kPitch -= kStep
     // if seven tones have been played, start again differently
     if (kNoteCount == 7) then
       kPitch = iStartPitch
       kPan = 0.9
       kStep /= 1.5
       kTrigMaxFreq /= 1.5
       kNoteCount = 0
       kNumHarm *= 1.5
       kCycleCount += 1
       schedulek("GenerateSpectrum",0,0,int(kNumHarm))
     endif
     // stop after six cycles
     if (kCycleCount == 7) then
       schedulek("Terminate",kCycleCount/kTrigMaxFreq,1)
       turnoff
     endif
   endif
   // print main values
   if (changed(kCycleCount) == 1) then
     printks("Cycle %d:\n",0,kCycleCount)
     printks("   kStep (semitones) and kTrigMaxFreq (Hz) = %.3f\n number of harmonics = %.3f\n",0,kStep,int(kNumHarm))
   endif
endin
schedule("Call",0,-1)

instr Play
   iPitch = p4
   iPan = p5
   aOut = oscili:a(0.2,mtof:i(iPitch),giSound)
   aOut = linen:a(aOut,0,p3,p3/2)
   aL,aR pan2 aOut,iPan
   out(aL,aR)
endin

instr Terminate
   event("e",0,0)
endin

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>