<CsoundSynthesizer>
<CsOptions>
  -o dac
</CsOptions>
<CsInstruments>

sr     = 44100
ksmps  = 128
nchnls = 2
0dbfs  = 1.0

instr 1
  ; smooth a krate signal  
  x:k = floor(line(0, p3, 10))
  x2:k = sclag(x, 0.1)
  printk2(x2)
endin

instr 2
  ; smooth an audio signal
  midi:k = floor(line(60, p3, 72)/2) * 2
  freq:a = upsamp(mtof(midi))
  freqsmooth:a = sclag(freq, 1)
  a1 = oscili(1, freq)
  a2 = oscili(1, freqsmooth)
  out(a1, a2 )
endin

</CsInstruments>
<CsScore>
i 1 0 5
i 2 0 10

</CsScore>
</CsoundSynthesizer>
