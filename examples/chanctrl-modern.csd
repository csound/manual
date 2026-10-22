<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   No messages  MIDI in
-odac            -d         -M hw:1,0  ;;;RT audio I/O with MIDI in
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o chanctrl.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1 ; press your midi keyboard and move your midi controller to see result
  chnl:i  = 1                   ;MIDI note inputs on channel 1
  ctlno:i = 7                   ;use midi volume controller 
  ch:k = chanctrl(chnl, ctlno)  ;to control amplitude of oscil
  printk2(ch)

  sig:a = poscil(ch*(1/127), 220)
  outs(sig, sig)
endin

</CsInstruments>
<CsScore>
;Dummy f-table to give time for real-time MIDI events
f 0 30
e

</CsScore>
</CsoundSynthesizer>