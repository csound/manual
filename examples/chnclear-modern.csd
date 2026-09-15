<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o chnclear.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
;Example by Joachim Heintz
sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1; send i-values
  chnset(1, "sio")
  chnset(-1, "non")
endin

instr 2; send k-values
  freq:k = randomi(100, 300, 1)
  chnset(freq, "cntrfreq")
  bw:k = freq/10
  chnset(bw, "bandw")
endin

instr 3; send a-values
  nois:a = rand(0.1)
  chnset(nois, "noise")
loop:
  dur:i = random(0.3, 1.5)
  timout(0, dur, do_)
  reinit(loop)
do_:
  freq:i = random(400, 1200)
  amp:i = random(0.1, 0.3)
  sig:a = oscils(amp, freq, 0)
  env:a = transeg(1, dur, -10, 0)
  sine:a = sig * env
  chnset(sine, "sine")
endin

instr 11; receive some chn values and send again
  val1:i = chnget("sio")
  val2:i = chnget("non")
  print(val1, val2)
  cntfreq:k = chnget("cntrfreq")
  bandw:k = chnget("bandw")
  nois:a = chnget("noise")
  filt:a = reson(nois, cntfreq, bandw)
  filt = balance(filt, nois)
  chnset(filt, "filtered")
endin

instr 12; mix the two audio signals
  mix1:a = chnget("sine")
  mix2:a = chnget("filtered")
  chnmix(mix1, "mix")
  chnmix(mix2, "mix")
endin

instr 20; receive and reverb
  mix:a = chnget("mix")
  aL, aR = freeverb(mix, mix, 0.8, 0.5)
  outs(aL, aR)
endin

instr 100; clear
  chnclear("mix")
endin

</CsInstruments>
<CsScore>
i 1 0 20
i 2 0 20
i 3 0 20
i 11 0 20
i 12 0 20
i 20 0 20
i 100 0 20
</CsScore>
</CsoundSynthesizer>