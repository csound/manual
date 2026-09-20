<CsoundSynthesizer>
<CsOptions>
-odac -d
; For a sound file, replace -odac with -o vco2ift.wav -W.
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Source waveform: a fundamental and seven successively weaker harmonics.
giSource ftgen 2, 0, 4096, 10, 1, 0.5, 0.333333, 0.25, 0.2, 0.166667, 0.142857, 0.125

; Register it as waveform -2. Start the generated tables AFTER the source
; table, so vco2init does not overwrite it. Each generated table has 4096
; points; 1.4 controls the spacing of the harmonic counts in the table set.
giNextFree vco2init -2, giSource + 1, 1.4, 4096, 4096, giSource
; giNextFree is the first unused table number after the generated set.

instr 1
  iFrequency = p4
  ; Select once at note start, keeping harmonics below sr/2.
  iTable vco2ift iFrequency, -2, 0.5
  printf_i "Frequency: %.0f Hz; selected table: %.0f\n", 1, iFrequency, iTable

  ; Use the SAME frequency for table selection and playback.
  aTone oscili 0.2, iFrequency, iTable
  aEnvelope linseg 0, 0.01, 1, p3 - 0.02, 1, 0.01, 0
  outs aTone * aEnvelope, aTone * aEnvelope
endin
</CsInstruments>
<CsScore>
; Higher notes need tables with fewer harmonics to stay below Nyquist.
i 1 0 2 220
i 1 3 2 1760
i 1 6 2 7040
e
</CsScore>
</CsoundSynthesizer>
