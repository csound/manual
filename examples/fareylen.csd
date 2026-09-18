<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>

sr=44100
ksmps=32
nchnls=1

; by Stefano Cucchi and Menno Knevel - 2024

instr 10

kfarnf randomi 1, 10, 4
kfarn ceil kfarnf

klenght fareylen kfarn  
printks "farey length of %d = %d\n",.1,  kfarn, klenght

endin

</CsInstruments>
<CsScore>

i 10 0 3
e
</CsScore>
</CsoundSynthesizer> 