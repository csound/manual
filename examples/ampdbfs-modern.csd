<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac -d    ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o ampdbfs.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2

instr 1
  idb = p4
  amp:i = ampdbfs(idb)
  sig:a = poscil(amp, 220)
  print(amp)
  outs(sig, sig)
endin

</CsInstruments>
<CsScore>
;sine wave.
i 1 0 1 -1
i 1 + 1 -5
i 1 + 1 -6
i 1 + 1 -20
e

</CsScore>
</CsoundSynthesizer>