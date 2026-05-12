<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac      ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; 
; By Stefano Cucchi - 2021
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

OSC1@global:i = oscinit(8020)

instr 3 ; OSC send
  Random:k = randomh(-50, 50, 4)
  Port:i = 8020
  oscsend(Random, "localhost", Port, "/boulevard", "f", Random)
endin

instr 4 ; OSC receive
  valuefrom3:k = init(0)
  data1:k = osclisten(OSC1, "/boulevard", "f", valuefrom3)
  printk2(valuefrom3)
endin 

</CsInstruments>
<CsScore>
i 3 0 5 
i 4 0 5
e
</CsScore>
</CsoundSynthesizer>