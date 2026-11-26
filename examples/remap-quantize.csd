<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o remap-quantize.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

; remap as a scale quantizer. With the same array for x and y, the nearest
; mode snaps any input to the closest value of the table. Here the table is
; C minor pentatonic over two octaves, and the input is an array of three
; random pitches, so one call quantizes a whole chord.

instr 1
  scale:i[] = fillarray(48, 51, 53, 55, 58, 60, 63, 65, 67, 70, 72)

  raw:k[] init 3
  chord:k[] init 3
  count:k init 0
  if metro(2) == 1 then
    raw[0] = random:k(46, 60)
    raw[1] = random:k(55, 68)
    raw[2] = random:k(62, 74)
    ; mode 1 nearest, bounds 1 clamp: pitches beyond the scale stick to its ends
    chord = remap(raw, scale, scale, 1, 1)
    count += 1
    printf("raw %5.2f %5.2f %5.2f -> %2d %2d %2d\n", count, \
           raw[0], raw[1], raw[2], chord[0], chord[1], chord[2])
  endif

  env:k = madsr(0.02, 0.1, 0.8, 0.3)
  voices:a = vco2(0.1, cpsmidinn(chord[0]), 12) + \
             vco2(0.1, cpsmidinn(chord[1]), 12) + \
             vco2(0.1, cpsmidinn(chord[2]), 12)
  voices = moogladder(voices * env, 1800, 0.3)
  out(voices, voices)
endin
</CsInstruments>
<CsScore>
i 1 0 8
e
</CsScore>
</CsoundSynthesizer>
