<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr ChooseBufferSize
  iDuration = p4

  // Round up so the buffer can hold the full duration.
  iSamples = ceil(iDuration * sr)
  iSize = nxtpow2(iSamples)

  // Allocate a zero-filled buffer with the chosen power-of-two length.
  iBuffer[] init iSize
  prints("%g seconds needs %.0f samples. Buffer length is %.0f.\n", \
         iDuration, iSamples, lenarray(iBuffer))
endin
</CsInstruments>
<CsScore>
i "ChooseBufferSize" 0   0.01 0.1
i "ChooseBufferSize" 0.1 0.01 0.25
e
</CsScore>
</CsoundSynthesizer>
