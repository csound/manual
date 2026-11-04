<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  ;-Ma   ;;;realtime audio out and midi in (on all inputs)
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o max_k.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; by Stefano Cucchi 2020

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
  Noise:a = noise(0.1, 0.1)         ; generate some noise
  Random:a = randomi(400, 12000, 4) ; generate random numbers from 400 to 1200 

  trig:k = metro(3) ; trigger signal

  Min:k = maxk(Random, trig, 3) ; minumum value 
  Max:k = maxk(Random, trig, 2) ; maximum value 

  printk(0.2, Min)
  printk(0.2, Max)

  noisehp:a = butterhp(Noise, Min)     ; hipass filter at kmin frequency
  noiselp:a = butterlp(Noise, Max*0.5) ; lopass filter at kmin/2 frequency

  comp:a = poscil(0.1, 440) ; comparator signal for consistent amplitude

  noisehp = balance(noisehp, comp) ; adjusting the volume
  noiselp = balance(noiselp, comp) ; adjusting the volume

  out(noisehp, noiselp)
endin

</CsInstruments>
<CsScore>

i1 0 10
e
</CsScore>
</CsoundSynthesizer>