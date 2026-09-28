<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
;example by joachim heintz
sr     = 44100
ksmps  = 32
nchnls = 2
0dbfs  = 1

instr 1 ;looplt: counts from 1 upwards and checks if < 10
  cnt:i = 1
loop:
  print(cnt)
  looplt(cnt, 1, 10, loop)
  prints("Instr 1 terminated!%n")
endin

instr 2 ;loople: counts from 1 upwards and checks if <= 10
  cnt:i = 1
loop:
  print(cnt)
  loople(cnt, 1, 10, loop)
  prints("Instr 2 terminated!%n")
endin

instr 3 ;loopgt: counts from 10 downwards and checks if > 0
  cnt:i = 10
loop:
  print(cnt)
  loopgt(cnt, 1, 0, loop)
  prints("Instr 3 terminated!%n")
endin

instr 4 ;loopge: counts from 10 downwards and checks if >= 0
  cnt:i = 10
loop:
  print(cnt)
  loopge(cnt, 1, 0, loop)
  prints("Instr 4 terminated!%n")
endin

</CsInstruments>
<CsScore>
i 1 0 0
i 2 0 0
i 3 0 0
i 4 0 0
</CsScore>
</CsoundSynthesizer>