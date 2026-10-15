<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr  = 44100
ksmps  = 16
nchnls  = 2
0dbfs   = 1


sine@global:i = ftgen(0, 0, 65537, 10, 1)
cutfq@global:k = init(6000)

instr modulation 
  cutfq = lfo(4000, 0.1) + 6000 
endin

instr bass       
  amp:i = ampdbfs(-12) 
  pch:i = cps2pch(p4, 12)

  sig:a = vco2(0.5, pch, 0)

  cut:a = expon(i(cutfq), p3, 200) 
  Out:a = diodeladder(sig, cut, 8, 1, 4)

  Out *= expseg(1.0, p3 - 0.05, 1.0, 0.05, 0.001) 
  Out = limit(Out, -1.0, 1.0)
  out(Out, Out)
endin

pat@global:i[] = init(8)
pat[0] = 6.00
pat[1] = 7.00
pat[2] = 6.00
pat[3] = 7.00
pat[4] = 5.07
pat[5] = 6.07
pat[6] = 5.08
pat[7] = 6.08

instr player
  ndx:i = p4

  ;; play instrument
  if pat[ndx] > 0 then
    schedule("bass", 0, 0.2, pat[ndx])
  endif

  ;; temporal recursion
  schedule("player", 0.2, 0.1, (ndx + 1) % lenarray(pat))
endin

schedule("modulation", 0, -1)
schedule("player", 0, 0.1, 0)
eventi("e", 0, 0.1 * 128)

</CsInstruments>

<CsScore>  
</CsScore>

</CsoundSynthesizer>