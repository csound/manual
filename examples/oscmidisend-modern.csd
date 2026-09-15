<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac           -iadc    ;;;RT audio I/O
</CsOptions>
<CsInstruments>

sr     = 44100
ksmps  = 128
nchnls = 1

; Example by David Akbari 2007
; Modified by Jonathan Murphy
; Use this file to generate OSC events for OSCmidircv.csd

#define IPADDRESS  #"localhost"#
#define PORT       #47120#

turnon 1000

instr 1000
  st:k, ch:k, d1:k, d2:k = midiin()
  oscsend(st+ch+d1+d2, $IPADDRESS, $PORT, "/midi", "iiii", st, ch, d1, d2)
endin

</CsInstruments>
<CsScore>
f 0 3600  ;Dummy f-table
e
</CsScore>
</CsoundSynthesizer>