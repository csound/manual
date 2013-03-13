<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac           -iadc    ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o loopsegp.wav -W ;;; for file output any platform
</CsOptions>

<CsInstruments>
sr=44100
ksmps=1
nchnls=2

; By Mark Van Peteghem 2008

   instr 1
iphase  = p4

kenv      linen 1, 0.1, p3, 0.1
kph_amp   phasor 2, 0
kamp      loopsegp kph_amp, 60, 1, 30, 1, 60
kamp    = ampdb(kamp)*kenv

kph_freq  phasor 2, iphase
klow_freq line 200, p3, 100
kfreq     loopsegp kph_freq, 400, 1, klow_freq, 1, 400

asig      vco2 kamp, kfreq, 2, 0.5

         outs asig, asig

   endin

</CsInstruments>

<CsScore>
i1 0 3 0
i1 + . 0.50
</CsScore>

</CsoundSynthesizer>
