<CsoundSynthesizer>
<CsOptions>
;-odac     ;;;realtime audio out

</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs  = 1

; This is the example file for ftprint

/*

  ftprint

  Print the contents of an f-table
  (mostly for debuggin purposes)

  ftprint ifn, ktrig=1, kstart=0, kend=0, kstep=1, inumcols=0

  ifn: the table to print
  ktrig: table will be printed whenever this changes
         from non-positive to positive
  kstart: start index
  kend: end index (non inclusive)
  kstep: number of elements to skip
  inumcols: number of elements to print per line

  See also: printarray

*/

instr 1
  ifn   ftgentmp 0, 0, -13, -2,  0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12

  ; print all elements
  ftprint ifn

  ; print all elements in columns of 4 elements
  ftprint ifn, 1, 0, 0, 1, 4

  ; print only the first 5 elements
  ftprint ifn, 1, 0, 5

  turnoff
endin

</CsInstruments>

<CsScore>
i 1 0 0.01
</CsScore>

</CsoundSynthesizer>
