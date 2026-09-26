<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac           -iadc     ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o cigoto.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr     = 44100
ksmps  = 128
nchnls = 2

instr 1
  fn1:i = p4
  val:i = p5
  elements:i = p6
  dstoffset:i = p7
  vmulti(fn1, val, elements, dstoffset)
endin

instr 2 ; Print table
  Table:i = p4
  size:i = ftlen(Table)
  Count:k = init(0)
  val:k = table(Count, Table)
  printk2(val)

  if Count == size then
    turnoff()
  endif

  Count += 1 
endin

</CsInstruments>

<CsScore>

f 1 0 16 -7 1 16 17

i2  0.0  0.2   1
i1  0.4  0.01  1   2      3    4
i2  0.8  0.2   1
i1  1.0  0.01  1   0.5    5   -3
i2  1.2  0.2   1
i1  1.4  0.01  1   1.5   10   12
i2  1.6  0.2   1
e

</CsScore>

</CsoundSynthesizer>