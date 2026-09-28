<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o tigoto2.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; by Steven Yi 2024

sr = 44100 
ksmps = 32 
nchnls = 2
0dbfs  = 1 

instr 1

iamp = ampdbfs(p5)
ipch = cps2pch(p4,12)
  
xtratim 4              ; extend the duration of the note
tigoto skipInit        ; csound "jumps" to the label, skipping initialization for the code in between
                       ; but only if this is a "tied" note  
kpch = port(ipch, 0.05, ipch)
asig = vco2(iamp, kpch)
;asig = zdf_2pole(asig, min:k(10000, kpch * 16), 4)  ; uncomment to use filter
asig *= linsegr(0, 1, 1, 4, 0)
out(asig, asig)
  
skipInit:
  
endin

</CsInstruments>
<CsScore>
i1 0 -.5 8.00 -12
i1 + -.5 9.00 -12
i1 + 2 6.00 -12

i1.1 .25 -.5 9.00 -12
i1.1 + -.5 10.00 -12
i1.1 + 2 7.00 -12

i1.2 1 -.25 7.00 .
i1.2 + 2 8.00 .
</CsScore>
</CsoundSynthesizer>