<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
-d        ;;;no display
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o atone.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 1
0dbfs  = 1

;by Victor Lazzarini 2008

instr 1
  dur:i = p3
  freq:i = p4

  scal:k = active(1)
  amp:k = port(1/scal, 0.01)
  sig:a = oscili(amp, freq)
  env:k = linseg(0, 0.1, 1, dur-0.2, 1, 0.1, 0)
  out(sig*env)
endin

</CsInstruments>
<CsScore>
i1 0 10 440
i1 1 3  220
i1 2 5  350
i1 4 3  700
e
</CsScore>
</CsoundSynthesizer>