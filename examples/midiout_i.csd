<CsoundSynthesizer>
<CsOptions>
-n -d --midioutfile=midiout_i.mid
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  // The alias sends one message at initialization, using explicit port 0.
  midiouti(p4, 1, p5, p6, 0)
endin

instr 2
  // The older spelling sends channel volume with the default port.
  midiout_i(176, 1, 7, 100)
endin
</CsInstruments>
<CsScore>
// Choose raw program number 21 and set the channel volume.
i 1 0 0.01 192 21 0
i 2 0 0.01
// Each note-on has a matching note-off half a second later.
i 1 0.1 0.01 144 60 80
i 1 0.6 0.01 128 60 0
i 1 0.8 0.01 144 64 80
i 1 1.3 0.01 128 64 0
e
</CsScore>
</CsoundSynthesizer>
