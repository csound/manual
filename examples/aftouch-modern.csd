<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   No messages  MIDI in
-odac           -d         -M hw:1,0  ;;;RT audio out with MIDI in
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
  aft:k = aftouch(0, 1)
  printk2(aft)

  ;aftertouch from music keyboard used for volume control
  sig:a = poscil(0.7 * aft, 220)
  outs(sig, sig)
endin

</CsInstruments>
<CsScore>
i 1 0 30
e

</CsScore>
</CsoundSynthesizer>