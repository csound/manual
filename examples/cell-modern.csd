<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac
; -iadc     ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o cell.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
; cell.csd by Gleb Rogozinsky

sr        = 44100
kr        = 4410
ksmps     = 10
nchnls    = 1
0dbfs     = 1

; Cellular automaton-driven synthesis in spectral domain
instr 1
  att:i = p4                                ; envelope attack time
  sus:i = p5                                ; envelope sustain time
  rel:i = p6                                ; envelope release time
  vol:i = p7                                ; overall volume
  
  ; create some white noise
  sig:a = rand(0.8)
  
  ; spectral analysis of sig
  fsig = pvsanal(sig, 2048, 1024, 2048, 0)  ; get a vector of magnitudes

  ; calculate cellular automaton state
  freq:k = line(50, 5, 1)                   ; variable CA triggering frequency
  trig:k = metro(freq)                      ; trigger the CA to update cells
  cell(trig, 0, 3, 1, 2, 2048)   ; cells are written into ftable 3 

  ; use current row of cells in spectral domain
  mask:f = pvstencil(fsig, 0, 1, 3)         ; apply spectral mask
  aout = pvsynth(mask)                      ; reconstruct time signal

  ; apply envelope and out signal
  env:k = expseg(0.001, att, 1, sus, 1, rel, 0.001)
  out(aout*env*vol)
endin

</CsInstruments>
<CsScore>

; This example uses one-dimensional cellular automaton
; to produce structures in spectral domain

; We have to prepare initial row of cells.
; One alive cell is enough to produce a simple fractal,
; so two alivee cells will make structure more sophisticated
f1 0 2048 7 0 150 0 0 1 1 1 0 0 45 0 0 1 1 1 0 0

; The CA rule is used as follows:
; the states (values) of each cell are summed with their neighboring cells.
; Each sum is used as an index to read a next state of cell
; from the rule table.
; Let us try rule # 129 (LSB binary 1 0 0 0 0 0 0 1).
; This rule will produce a fractal structure for single active cell
; For more rules see http://mathworld.wolfram.com/ElementaryCellularAutomaton.html
f2 0 8 -2 1 0 0 0 0 0 0 1
; Try some different rules i.E. 254 (0 1 1 1 1 1 1 1) or 169 (1 0 0 1 0 1 0 1)

; Prepare the output table of ielements size
f3 0 2048 10 0

; Time to make it sound!
i1 0  13  0.3  7  3  1 
e

</CsScore>
</CsoundSynthesizer>