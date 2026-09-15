<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-n  ;;;no output
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o serialwrite.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr  = 44100
ksmps = 500 ; the default krate can be too fast for the arduino to handle
nchnls  = 2
0dbfs   = 1

instr 1
  Port:i = serialbegin("/dev/cu.usbmodemfa131", 9600) ;connect to the arduino
                                                      ;with baudrate = 9600
  Gain:k = init(16)         ;read our knob value
  Val:k = serialread(Port)
  if Val != -1 then
    Gain = Val/128
  endif

  Sig:a = in()          ;get our audio input and get its rms
  Rms:k = rms(Sig*Gain)

  Rms = Rms*Rms*255     ;scale the rms to a good value for the LED and send it out
  serialwrite(Port, (Rms < 255 ? Rms : 255))   ;must be in range: 0-255
endin
</CsInstruments>
<CsScore>
f 1 0 1024 10 1 1 1 1 1 1

i 1 0 200
e
</CsScore>
</CsoundSynthesizer>
