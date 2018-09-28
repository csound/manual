<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

; Example for opcode bpf

/*

  bpf stands for Break Point Function

  Given an x value and a series of pairs (x, y), it returns
  the corresponding y value in the linear curve defined by the
  pairs

  It works both at i- and k- time

  ky    bpf kx,    kx0, ky0, kx1, ky1, kx2, ky2, ...
  kys[] bpf kxs[], kx0, ky0, kx1, ky1, kx2, ky2, ...

  NB: x values must be ordered (kx0 < kx1 < kx2 etc)

  See also: bpfcos, linlin, lincos
    
*/
  
ksmps = 64
nchnls = 2

instr 1
  kx line -1, p3, 2.5
  ky bpf kx,        \
         0,    0,   \
         1.01, 10,  \
         2,    0.5, \
         2.5,  -1
  printks "kx: %f   ky: %f \n", 0.1, kx, ky
endin

instr 2
  ; test i-time
  ix = 1.2
  iy bpf ix, 0,0, 0.5,5, 1,10, 1.5,15, 2,20, 2.5,25, 3,30
  print iy
  turnoff
endin

instr 3
  ; bpf also works with arrays
  kx[] fillarray 0, 0.15, 0.25, 0.35, 0.45, 0.55, 0.6
  ky[] bpf kx, 0,0, 0.1,10, 0.2,20, 0.3,30, 0.4,40, 0.5,50
  printarray ky, 1, "", "ky="
  turnoff
endin
    
</CsInstruments>
<CsScore>
i 1 1 3 
i 2 0 -1
i 3 0 -1

</CsScore>
</CsoundSynthesizer>
