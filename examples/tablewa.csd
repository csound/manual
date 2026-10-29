<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 4
nchnls = 1
0dbfs = 1

; Based on the table-processing examples by Robin Whittle.
; GEN02 with a negative generator number keeps the supplied values.
giSource ftgen 0, 0, 16, -2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
giDestination ftgen 0, 0, 16, -2, 0

instr 1
  kDone init 0
  if kDone == 0 then
    kRead = 0
    ; Process four samples per pass, stopping after all 16 values.
    while kRead < ftlen(giSource) do
      aValues tablera giSource, kRead, 0
      aLogs = log(aValues)
      kNext tablewa giDestination, aLogs, 0
      kRead += ksmps
    od

    ; kNext is 16 here. It is not a zero-valued end marker.
    printf "Next write position = %.0f\n", 1, kNext
    kIndex = 0
    while kIndex < ftlen(giDestination) do
      kValue table kIndex, giDestination
      printf "table[%2.0f] = %.6f\n", kIndex + 1, kIndex, kValue
      kIndex += 1
    od
    kDone = 1
  endif
endin
</CsInstruments>
<CsScore>
i 1 0 0.01
e
</CsScore>
</CsoundSynthesizer>
