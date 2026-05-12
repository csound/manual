<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    No messages
-odac         ;  -iadc     -d     ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o oscilbank.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

/* Written by Istvan Varga */
sr     =  48000
kr     =  750
ksmps  =  64
nchnls =  2

ga01 = init(0)
ga02 = init(0)

/* sawtooth wave */
i_ = ftgen(1, 0, 16384, 7, 1, 16384, -1)
/* FM waveform */
i_ = ftgen(3, 0, 4096, 7, 0, 512, 0.25, 512, 1, 512, 0.25, 512,  \
                          0, 512, -0.25, 512, -1, 512, -0.25, 512, 0)
/* AM waveform */
i_ = ftgen(4, 0, 4096, 5, 1, 4096, 0.01)
/* FM to EQ */
i_ = ftgen(5, 0, 1024, 5, 1, 512, 32, 512, 1)
/* sine wave */
i_ = ftgen(6, 0, 1024, 10, 1)
/* room parameters */
i_ = ftgen(7, 0, 64, -2, 4, 50, -1, -1, -1, 11,                      \
                         1, 26.833, 0.05, 0.85, 10000, 0.8, 0.5, 2,  \
                         1,  1.753, 0.05, 0.85,  5000, 0.8, 0.5, 2,  \
                         1, 39.451, 0.05, 0.85,  7000, 0.8, 0.5, 2,  \
                         1, 33.503, 0.05, 0.85,  7000, 0.8, 0.5, 2,  \
                         1, 36.151, 0.05, 0.85,  7000, 0.8, 0.5, 2,  \
                         1, 29.633, 0.05, 0.85,  7000, 0.8, 0.5, 2)

/* generate bandlimited sawtooth waves */

i0 = 0
while i0 < 128 do
  maxh:i = sr / (2 * 440.0 * exp(log(2.0) * (i0 - 69) / 12))
  i_ = ftgen(i0 + 256, 0, 4096, -30, 1, 1, maxh)
  i0 += 1
od

instr 1
  p3 += 0.4

  ; note frequency
  cps:k =  440.0 * exp(log(2.0) * (p4 - 69) / 12)
  ; lowpass max. frequency
  lpmaxf:k = limit(64 * cps, 1000.0, 12000.0)
  ; FM depth in Hz
  fmd1:k = 0.02 * cps
  ; AM frequency
  amfr:k = cps * 0.02
  amfr2:k = cps * 0.1
  ; table number
  fnum:k = (256 + 69 + 0.5 + 12 * log(cps / 440.0) / log(2.0))
  ; amp. envelope
  env:a = linseg(0, 0.1, 1.0, p3 - 0.5, 1.0, 0.1, 0.5, 0.2, 0, 1.0, 0)

  /* oscillator / left */

  a1 = oscilbank(cps, 0.0, fmd1, 0.0, 40, 200, 0.1, 0.2, 0, 0, 144,         \
                 0.0, lpmaxf, 0.0, 0.0, 1.5, 1.5, 2,                        \
                 fnum, 3, 0, 5, 5, 5)
  a2 = oscilbank(cps, 1.0, fmd1, 0.0, 40, 201, 0.1, 0.2, amfr, amfr2, 148,  \
                 0, 0, 0, 0, 0, 0, -1,                                      \
                 fnum, 3, 4)
  a2 = pareq(a2, cps * 8, 0.0, 0.7071, 2)
  a0 =  a1 + a2 * 0.12
  /* delay */
  del:a  = 0.001
  a01 = vdelayx(a0, del, 0.01, 16)
  a_ = oscili(1.0, 0.25, 6, 0.0)
  del +=  1.0 / (exp(log(2.0) * a_) * 8000)
  a02 = vdelayx(a0, del, 0.01, 16)
  a0 = a01 + a02

  ga01 +=  a0 * env * 2500

  /* oscillator / right */

  ; lowpass max. frequency

  a1 = oscilbank(cps, 0.0, fmd1, 0.0, 40, 202, 0.1, 0.2, 0, 0, 144,         \
                 0.0, lpmaxf, 0.0, 0.0, 1.0, 1.0, 2,                        \
                 fnum, 3, 0, 5, 5, 5)
  a2 = oscilbank(cps, 1.0, fmd1, 0.0, 40, 203, 0.1, 0.2, amfr, amfr2, 148,  \
                 0, 0, 0, 0, 0, 0, -1,                                      \
                 fnum, 3, 4)
  a2 = pareq(a2, cps * 8, 0.0, 0.7071, 2)
  a0 = a1 + a2 * 0.12
  /* delay */
  adel = 0.001
  a01 = vdelayx(a0, adel, 0.01, 16)
  a_  = oscili(1.0, 0.25, 6, 0.25)
  adel +=  1.0 / (exp(log(2.0) * a_) * 8000)
  a02 = vdelayx(a0, adel, 0.01, 16)
  a0 = a01 + a02

  ga02 += a0 * env * 2500
endin

/* output / left */

instr 81
  i1 = 0.000001
  aLl, aLh, aRl, aRh = spat3di(ga01 + i1*i1*i1*i1, -8.0, 4.0, 0.0, 0.3, 7, 4)
  ga01 = 0
  aLl = butterlp(aLl, 800.0)
  aRl = butterlp(aRl, 800.0)
  outs(aLl + aLh, aRl + aRh)
endin

/* output / right */

instr 82
  i1 = 0.000001
  aLl, aLh, aRl, aRh = spat3di(ga02 + i1*i1*i1*i1, 8.0, 4.0, 0.0, 0.3, 7, 4)
  ga02 = 0
  aLl = butterlp(aLl, 800.0)
  aRl = butterlp(aRl, 800.0)
  out(aLl + aLh, aRl + aRh)
endin

</CsInstruments>
<CsScore>

/* Written by Istvan Varga */
t 0 60

i 1 0 4 41
i 1 0 4 60
i 1 0 4 65
i 1 0 4 69

i 81 0 5.5
i 82 0 5.5
e


</CsScore>
</CsoundSynthesizer>
