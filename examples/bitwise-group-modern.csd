<CsoundSynthesizer>
<CsOptions>
--nosound
</CsOptions>
<CsInstruments>

sr     = 44100
ksmps  = 32
nchnls = 2
0dbfs  = 1

; By Daniele Cucchi - 2020

;a & b: bitwise AND
;a | b: bitwise OR
;a # b: bitwise NON EQUIVALENCE - XOR
; ~ a: bitwise NOT

instr 1
  ArrayA:k[] = fillarray(0, 0, 1, 1)  ; Fill array "A" with 4 values: 0, 0, 1, 1
  i0A = i(ArrayA, 0)
  i1A = i(ArrayA, 1)
  i2A = i(ArrayA, 2)
  i3A = i(ArrayA, 3)

  ArrayB:k[] = fillarray(0, 1, 0, 1)  ; Fill array "B" with 4 values: 0, 1, 0, 1
  i0B = i(ArrayB, 0)
  i1B = i(ArrayB, 1)
  i2B = i(ArrayB, 2)
  i3B = i(ArrayB, 3)

  ; Bitwise operations & fill arrays
  AND:k[] = ArrayA & ArrayB
  OR:k[] = ArrayA | ArrayB
  NON:k[] = fillarray(i0B # i0A, i1B # i1A, i2B # i2A, i3B # i3A)
  NOT:k[] = fillarray(~i0A & 1, ~i1A & 1, ~i2A & 1, ~i3A & 1)

  ; Print values 
  printarray(AND, "%d", "= bitwise AND")
  printarray(OR, "%d", "= bitwise OR")
  printarray(NON, "%d", "= bitwise NON")
  printarray(NOT, "%d", "= bitwise NOT")
endin

</CsInstruments>
<CsScore>
i1 0 0.001
e
</CsScore>
</CsoundSynthesizer>