<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    No messages
; -odac      -iadc     -d     ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o bformenc.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 8
0dbfs =  1

instr 1 ;without arrays
  ; generate pink noise
  anoise = pinkish(1)
        
  ; two full turns
  alpha:k = line(0, p3, 720)
  beta:k = 0

  ; generate B format
  aw, ax, ay, az, ar, as, at, au, av = bformenc1(anoise, alpha, beta)

  ; decode B format for 8 channel circle loudspeaker setup
  a1, a2, a3, a4, a5, a6, a7, a8 = bformdec1(4, aw, ax, ay, az, ar, as, at, au, av)

  ; write audio out
  outo(a1, a2, a3, a4, a5, a6, a7, a8)
endin

instr 2 ;with arrays (csound6)
  ;set file names for:
  ;S_bform = "bform_out.wav" ;b-format (2nd order) output
  sound:S = "sound_out.wav" ;sound output

  ; generate pink noise
  anoise = pinkish(1)
        
  ; two full turns
  alpha:k = line(0, p3, 720)
  beta:k = 0
        
  ;create array for B-format 2nd order (9 chnls)
  Bform:a[] = init(9)

  ; generate B-format
  Bform = bformenc1(anoise, alpha, beta)

  ;write out b-format
  fout("fout.wav", 18, Bform)

  ;create array for audio output (8 channels)
  Audio:a[] = init(8)

  ;decode B format for 8 channel circle loudspeaker setup
  Audio = bformdec1(4, Bform)

  ; write audio out
  fout(sound, 18, Audio)
endin

</CsInstruments>
<CsScore>
i 1 0 8
i 2 8 8
e
</CsScore>
</CsoundSynthesizer>
