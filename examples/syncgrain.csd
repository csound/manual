<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o syncgrain.wav -W ;;; for file output any platform
</CsOptions> 
<CsInstruments>

sr = 44100 
ksmps = 32 
0dbfs  = 1 
nchnls = 2
  
instr 1
                
iolaps  = 2
igrsize = 0.04
ifreq   = iolaps/igrsize
ips     = 1/iolaps

istr    = .3   /* timescale  */
ipitch  = p4   /* pitchscale */

asig    syncgrain 1, ifreq, ipitch, igrsize, ips*istr, 1, 2, iolaps
        outs      asig, asig 

endin
</CsInstruments>
<CsScore>
f1 0 0 1 "Mathews.wav" 0 0 0    ;deferred table
f2   0   8192   20   2   1

i1 0 11 1
i1 + 11 4
i1 + 11 .8
e
</CsScore>
</CsoundSynthesizer> 