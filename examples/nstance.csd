<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac           -iadc    ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o nstance.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
kr = 4410
ksmps = 10
nchnls = 1

; Instrument #1 - oscillator with a high note.
instr 1
  ; Play Instrument #2 at the same time.
  iHandle nstance 2, 0, p3

  ; Play a high note.
  a1 oscils 10000, 880, 1
  out a1
endin

; Instrument #2 - oscillator with a low note.
instr 2
  ; Play a low note.
  a1 oscils 10000, 220, 1
  out a1
endin


; ---------------------------------------------------------------
; nstance can be used to control the lifetime of a launched event


instr sineoscil
  ifreq = p4
  a0 oscili 0.1, ifreq
  aenv linsegr 0, 0.1, 1, 0.1, 0
  a0 *= aenv
  outch 1, a0
endin

instr turnoff
  iid = p4
  prints "turning off id %d\n", iid
  turnoff(iid)
endin

instr master
  ; event with a unique p1. Although isynth is a itime variable, at itime
  ; it has a value of 0!!. Only at performance time it turns valid
  
  isynth nstance nstrnum("sineoscil")+0.01, 0, -1, 442
  
  ; At the very first cycle schedule a turnoff using the handle number,
  ; not the fractional p1. Notice that this operation needs to be done
  ; at performance time to have a valid handle
  if timeinstk() == 1 then
    ksynth = isynth
    schedulek "turnoff", 2, 0, ksynth
  endif
endin


</CsInstruments>
<CsScore>

; Table #1, a sine wave.
f 1 0 16384 10 1

; Play Instrument #1 for half a second.
i 1 0 0.5
; Play Instrument #1 for half a second.
i 1 1 0.5

i "master" 0 10

e


</CsScore>
</CsoundSynthesizer>

