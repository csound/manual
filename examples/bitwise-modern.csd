<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2

instr 1
  resultOr:i = p4 | p5
  resultAnd:i = p4 & p5
  prints("%i | %i  = %i\\n", p4, p5, resultOr)
  prints("%i & %i  = %i\\n", p4, p5, resultAnd)
endin


instr 2 ; decimal to binary converter
  binary:S = ""
  numbits:i = 8
  Count:i = init(numbits - 1)

  while Count >= 0 do
    value:i = 2 ^ Count
    if (p4 & value) == value then
      digit:S = "1"
    else
      digit = "0"
    endif
    binary:S = strcat(binary, digit)
    Count -= 1
  od

  text:S = sprintf("%i is %s in binary\\n", p4, binary)
  prints(text)
endin

</CsInstruments>
<CsScore>
i 1 0 0.1  1  2
i 1 +  .   1  3
i 1 +  .   2  4
i 1 +  .   3  10

i 2 2 0.1  12
i 2 +  .   9
i 2 +  .   15
i 2 +  .   49

e
</CsScore>
</CsoundSynthesizer>