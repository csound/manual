<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
;-o printf.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
  file:S = strget(p4)
  vld:i = filevalid(file)

  if vld == 0 then
    printfi("Audiofile '%s' does not exist!\n", 1, file)
  else
    sig:a = diskin2(file, 1)
    outs(sig, sig)
  endif
endin

</CsInstruments>
<CsScore>

i 1 0 3 "frox.wav";file does not exist!!!
i 1 + 3 "fox.wav";but this one certainly does...

e
</CsScore>
</CsoundSynthesizer>