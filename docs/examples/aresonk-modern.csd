<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac -d    ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o aresonk.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs =  1

sine@global:i = ftgen(0, 0, 2^10, 10, 1)

instr 1
  sig:k = randomh(400, 1800, 150)
  aout = poscil(0.2, 1000+sig, sine)
  outs(aout, aout)
endin

instr 2
  sig:k = randomh(400, 1800, 150)
  bw:k = line(1, p3, 600)         ; vary bandwith
  sig:k = aresonk(sig, 800, bw)
  aout = poscil(0.2, 1000+sig, sine)
  outs(aout, aout)
endin

</CsInstruments>
<CsScore>
i 1 0 5
i 2 5.5 5
e
</CsScore>
</CsoundSynthesizer>