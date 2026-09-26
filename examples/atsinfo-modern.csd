<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-n     ;;;no audio out
</CsOptions>
<CsInstruments>

;example by joachim heintz (& Menno Knevel)

sr = 44100
ksmps = 32
nchnls = 2
0dbfs =  1
;ATSA wants a mono file!
res:i = systemi(1, {{ atsa fox.wav fox.ats }}) ; default settings

instr 1 
  file:S = "fox.ats"
  isr = atsinfo(file, 0)
  ifs = atsinfo(file, 1)
  iws = atsinfo(file, 2)
  inp = atsinfo(file, 3)
  inf = atsinfo(file, 4)
  ima = atsinfo(file, 5)
  imf = atsinfo(file, 6)
  id  = atsinfo(file, 7)
  ift = atsinfo(file, 8)
  prints({{
*****fox.ats*********************
0. Sample rate = %d Hz
1. Frame Size  = %d samples
2. Window Size = %d samples
3. contains      %d partials
4. contains      %d frames
5. Max. Ampl.  = %f
6. Max. Freq.  = %f Hz
7. Duration    = %f seconds
8. File Type   = %d
*********************************\\n
}}, isr, ifs, iws, inp, inf, ima, imf, id, ift)
endin
</CsInstruments>
<CsScore>
i 1 0 0 
e
</CsScore>
</CsoundSynthesizer>