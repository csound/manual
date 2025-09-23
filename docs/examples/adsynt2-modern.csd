<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
-d        ;;;no display
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o adsynt2.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs =  1

; Generate a sinewave table.
wave@global:i = ftgen(1, 0, 1024, 10, 1)
; Generate two empty tables for adsynt.
frqs@global:i = ftgen(2, 0, 32, 7, 0, 32, 0)
; A table for freqency and amp parameters.
amps@global:i = ftgen(3, 0, 32, 7, 0, 32, 0)
  
; Generates parameters at init time
instr 1
  ; Generate 10 voices.
  cnt:i = 10 
  ; Init loop index.
  index = 0 

  ; Loop only executed at init time.
  while index < cnt do 
    ; Define non-harmonic partials.
    freq:i = pow(index + 1, 1.5)
    ; Define amplitudes.
    amp:i = 1 / (index+1)
    ; Write to tables.
    tableiw(freq, index, frqs)
    ; Used by adsynt.
    tableiw(amp, index, amps)
    index += 1
  od
  
  sig:a = adsynt(0.4, 150, wave, frqs, amps, cnt)
  outs(sig, sig)
endin

; Generates parameters every k-cycle.
instr 2 
  ; Generate 10 voices.
  cnt:i = 10 
  ; Reset loop index.
  index:k = 0

  ; Loop executed every k-cycle.
  while index < cnt do 
    ; Generate lfo for frequencies.
    speed:k = pow(index + 1, 1.6)
    ; Individual phase for each voice.
    phas:k = phasorbnk(speed * 0.7, index, cnt)
    lfo_sig:k = table(phas, wave, 1)
    ; Arbitrary parameter twiddling...
    depth:k = pow(1.4, index)
    freq:k = pow(index + 1, 1.5)
    freq += lfo_sig*0.006*depth

    ; Write freqs to table for adsynt.
    tablew(freq, index, frqs) 
  
    ; Generate lfo for amplitudes.
    speed = pow(index + 1, 0.8)
    ; Individual phase for each voice.
    phas = phasorbnk(speed*0.13, index, cnt, 2)
    lfo_sig = table(phas, wave, 1)
    ; Arbitrary parameter twiddling...
    amp:k = pow(1 / (index + 1), 0.4)
    amp *= (0.3 + 0.35*(lfo_sig+1))

    ; Write amps to table for adsynt.
    tablew(amp, index, amps)
  
    index += 1
  od

  sig:a = adsynt2(0.25, 150, wave, frqs, amps, cnt)
  outs(sig, sig)
endin


</CsInstruments>
<CsScore>

; Play Instrument #1 for 2.5 seconds.
i 1 0 2.5
; Play Instrument #2 for 2.5 seconds.
i 2 3 2.5
e


</CsScore>
</CsoundSynthesizer>
