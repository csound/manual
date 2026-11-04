<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
-d        ;;;no display
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o 0dbfs.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
ksmps = 10
nchnls = 2

; Set the 0dbfs to 1.
0dbfs = 1

instr 1  ; from linear amplitude (0-1 range)
  print(p4)
  a1 = poscil(p4, 440)
  outs(a1, a1)
endin

instr 2  ; from linear amplitude (0-32767 range)
  amp:i = p4 / 32767
  print(amp)
  a1 = poscil(amp, 440)
  outs(a1, a1)
endin

instr 3  ; from dB FS
  amp:i = ampdbfs(p4)
  print(amp)
  a1 = poscil(amp, 440)
  outs(a1, a1)
endin

</CsInstruments>
<CsScore>

; Table #1, a sine wave.
i 1 0 1   1
i 1 + 1   0.5
i 1 + 1   0.1
s
i 2 0 1   32767
i 2 + 1   [32767/2]
i 2 + 1   [3276.7]
s
i 3 0 1   0
i 3 + 1   -6
i 3 + 1   -20
e

</CsScore>
</CsoundSynthesizer>
 