<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o vpowi-2.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

fil@global:i = ftgen(1, 0, 0, 1, "fox.wav", 0, 0, 1)

instr 1
  val:i = p4                         ;different distortion settings
  elements:i = p5
  dstoffset:i = p6                   ;index offset
  vpowi(1, val, elements, dstoffset)
  sig:a = lposcil(1, 1, 0, 0, 1)
  out(sig, sig)
endin
</CsInstruments>
<CsScore>
        
i1  0  2.7  0.5   70000  0     ; no offset
i1  3  2.7  0.01  50000  70000 ; add another period of distortion,
                               ; starting at sample 70000     

e
</CsScore>
</CsoundSynthesizer>