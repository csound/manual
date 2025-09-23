<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
;-o convolve.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
; NB: 'Small' reverbs often require a much higher percentage of wet signal to sound interesting. 'Large'
; reverbs seem require less. Experiment! The wet/dry mix is very important - a small change can make a large difference.

sr = 44100
ksmps = 32
nchnls = 2
0dbfs =  1

; by Menno Knevel - 2021

; analyze mono spring reverb
res1:i = system_i(1, {{ cvanal rv_mono.wav rv_mono.con }})
; analyze stereo spring reverb
res2:i = system_i(1, {{ cvanal rv_stereo.wav rv_stereo.con }})

instr 1 
  mix:i = 0.25     ;wet/dry mix. Vary as desired.
  vol:i = 0.8      ;Overall volume level of reverb. Adjust to avoid clipping.

  ;calculate length and number of channels of soundfile
  del:i = filelen(p4)
  chnls:i = filenchnls(p4)
  prints("\n**this reverb file = %f seconds and has %d channel(s)**\n", del, chnls)

  if chnls == 1 then                    ; if mono
    dry:a = soundin("fox.wav")          ; input (dry) audio
    wet:a = convolve(dry,"rv_mono.con") ; mono convolved (wet) audio
    wet1:a = diff(wet)                  ; brighten sound
    wet2:a = wet1                       ; as it is a mono file played stereo
    drydel:a = delay((1-mix)*dry, del)  ; Delay dry signal to align it with
                                        ; convolved signal
  else                                  ; if stereo
    dry = soundin("fox.wav")            ; input (dry) audio
    wet1, wet2 = convolve(dry,"rv_stereo.con") ; stereo convolved (wet) audio
    wet1 = diff(wet1)                   ; brighten left sound
    wet2 = diff(wet2)                   ; and brighten right sound
    drydel = delay((1-mix)*dry, del)    ; Delay dry signal to align it with
                                        ; convolved signal
  endif
  outs(vol*(drydel+mix*wet1), vol*(drydel+mix*wet2)) ; Mix wet & dry signals
endin

</CsInstruments>
<CsScore>

i 1 0 4 "rv_mono.wav"
i 1 5 4 "rv_stereo.wav"
e
</CsScore>
</CsoundSynthesizer>