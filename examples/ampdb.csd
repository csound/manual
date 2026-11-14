<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o ampdb.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1

idb  =  p4
iamp =  ampdbfs(idb)
asig    oscil iamp, 220
        print ampdb(idb)
        outs  asig, asig
endin


</CsInstruments>
<CsScore>
i 1 0 1 -40
i 1 + 1 0
i 1 + 1 -22
i 1 + 1 -10

e

</CsScore>
</CsoundSynthesizer>