<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1
  iBytes = floatsize()
  printf_i "Internal numbers use %g bytes (%g bits)\n", 1, iBytes, 8 * iBytes

  ; Allow more rounding error when Csound uses single precision.
  if iBytes == 4 then
    iTolerance = 0.000001
  else
    iTolerance = 0.000000000001
  endif

  iRoot = sqrt(2)
  iError = abs(iRoot * iRoot - 2)

  ; Compare with a tolerance instead of requiring exact equality.
  if iError < iTolerance then
    prints "Square-root check passed\n"
  else
    prints "Square-root check failed\n"
  endif
endin
</CsInstruments>
<CsScore>
i 1 0 0.01
e
</CsScore>
</CsoundSynthesizer>
