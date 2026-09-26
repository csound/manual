<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-n
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

;8 points sine wave function table
Sine@global:i = ftgen(0, 0, 8, 10, 1)

instr 1
  ;create array
  Arr:k[] = init(8)

  ;copy table values in it
  copyf2array(Arr, Sine)

  ;print values
  ndx:k = 0
  until ndx == lenarray(Arr) do
    printf("kArr[%d] = %f\n", ndx+1, ndx, Arr[ndx])
    ndx += 1
  od

  ;turn instrument off
  turnoff()
endin
  
</CsInstruments>
<CsScore>
i 1 0 0.1
</CsScore>
</CsoundSynthesizer>