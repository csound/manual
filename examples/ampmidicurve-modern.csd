<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
;;;RT audio out, note=p4 and velocity=p5
-odac -d --midi-key=4 --midi-velocity-amp=5
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o ampmidid.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs =  1

massign(0, 1)    ;assign all midi to instr. 1

instr 1
  sine:i ftgenonce 0, 0, 4096, 10, 1 ;sine wave
  hz:i = cpsmidinn(p4)
  velocity:i = p5
  ; MIDI velocity to signal amplitude.
  amplitude:i = ampdb(velocity)
  ; Gain with compressed dynamic range, soft knee.
  igain = ampmidicurve(velocity, 0.92, 3)
  print(velocity, amplitude, igain)
  a1 = oscili(1, hz, sine)
  env:a = madsr(0.05, 0.1, 0.5, 0.2)
  sig:a = a1 * env * igain
  outs(sig, sig)
endin

</CsInstruments>
<CsScore>
;       note velocity
i 1 0 2  61  100
i 1 + 2  65  10
e
</CsScore>
</CsoundSynthesizer>