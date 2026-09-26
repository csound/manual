<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  -iadc    ;;;RT audio out and in
; For Non-realtime ouput leave only the line below:
; -o compress.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
nchnls_i = 1    ; assume only one mono signal for audio input!
0dbfs  = 1


instr 1 ; uncompressed signal
  sig:a = diskin2("drumsMlp.wav", 1, 0, 1)
  outs(sig, sig)
endin

instr 2 ; compressed signal, use the "drumsMlp.wav" audio file and a soundfile
  Voice:a = diskin2("Mathews.wav", 1, 0, 1)
  sig:a = diskin2("drumsMlp.wav", 1, 0, 1)
  prints("***compressing according to Mathews.wav***\n\n")
  thresh:k = 0
  loknee:k = 40
  hiknee:k = 60
  ratio:k  = 5
  att:k    = 0.01
  rel:k    = 0.1
  look:i   = 0.02
  ; voice-activated compressor
  sig = compress(sig, Voice, thresh, loknee, hiknee, ratio, att, rel, look)
  outs(sig, sig)
endin

instr 3 ; compressed signal, use the "drumsMlp.wav" audio file and a mic
  Voice:a = in()    ; duck the audio signal "drumsMlp.wav" with your voice.
  sig:a = diskin2("drumsMlp.wav", 1, 0, 1)
  prints("***compressing according to your mic -- if present***\n\n")
  thresh:k = 0
  loknee:k = 40
  hiknee:k = 60
  ratio:k  = 3
  att:k    = 0.1
  rel:k    = 0.5
  look:i   = 0.02
  ; voice-activated compressor
  sig = compress(sig, Voice, thresh, loknee, hiknee, ratio, att, rel, look)
  outs(sig, sig)
endin

</CsInstruments>
<CsScore>
s
i1 0 4
s
i2 0 16
s
i3 0 30
e
</CsScore>
</CsoundSynthesizer>