<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
0dbfs = 1

/* case 1
   loop var is not declared
   loop type follows array type
   (i-type in this case)
*/
instr 1
for j in [1,2,3] do
 print j
od
endin

/* case 2
   loop var is declared
   loop type follows var type
   regardless of array type
*/
instr 2
j:k init 0
for j in [1,2,3] do
 printk2 j
od
turnoff
endin

instr 3
for j, i in [2,4,6] do
 print i,j
od
turnoff
endin


</CsInstruments>
<CsScore>
i1 0 0
i2 0 1
i3 0 0
</CsScore>
</CsoundSynthesizer>


