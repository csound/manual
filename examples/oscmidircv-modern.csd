<CsoundSynthesizer>
; network_recv.csd
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac           -iadc    ;;;RT audio I/O
</CsOptions>
<CsInstruments>

sr     = 44100
ksmps  = 128
nchnls = 1

; Example by Jonathan Murphy and Andres Cabrera 2007
; Use file OSCmidisend.csd to generate OSC events for this file

0dbfs = 1

listen@global:i = oscinit(47120)

sine@global:i = ftgen(1, 0, 16384, 10, 1)
vel@global:i = ftgen(2, 0, 128, -2, 0)
cc@global:i = ftgen(3, 0, 128, -7, 100, 128, 100)  ;Default all controllers to 100
 
;Define scale tuning
ji_12@global:i = ftgen(202, 0, 32, -2, 12, 2, 256, 60, 1, 16/15, 9/8, 6/5, 5/4, \
                                       4/3, 7/5, 3/2, 8/5, 5/3, 9/5, 15/8, 2)

#define DEST #"/midi"#
; Use controller number 7 for volume
#define VOL #7#

turnon 1000

instr 1000
  st:k = init(0)
  ch:k = init(0)
  d1:k = init(0)
  d2:k = init(0)

  until osclisten(listen, $DEST, "iiii", st, ch, d1, d2) == 0 do
    printks("kst = %i, kch = %i, kd1 = %i, kd2 = %i\\n", \
            0, st, ch, d1, d2)

    if (st == 176) then
      ;Store controller information in a table
      tablew(d2, d1, cc)
    endif  

    if (st == 144) then
      ;Process noteon and noteoff messages.
      key:k = d1
      vel:k = d2
      cps:k = cpstun(vel, key, ji_12)
      amp:k = vel/127

      if (vel == 0) then
        turnoff2(1001, 4, 1)
      elseif (vel > 0) then
        event("i", 1001, 0, -1, cps, amp)
      endif
    endif
  od
endin

instr 1001   ;Simple instrument
  cps:i = p4
  vol:k = table($VOL, cc)  ;Read MIDI volume from controller table
  vol /= 127

  env:a = linsegr(0, .003, p5, 0.03, p5 * 0.5, 0.3, 0)
  osc:a = oscil(env, cps, sine)
  out(osc * vol)
endin

</CsInstruments>
<CsScore>
f 0 3600  ;Dummy f-table
e
</CsScore>
</CsoundSynthesizer>