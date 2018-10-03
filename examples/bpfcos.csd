<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

; Example for opcode bpfcos

/*

  bpf stands for Break Point Function

  Given an x value and a series of pairs (x, y), it returns
  the corresponding y value in the half cosine curve defined by the
  pairs

  It works both at i- and k- time

  ky    bpfcos kx,    kx0, ky0, kx1, ky1, kx2, ky2, ...
  kys[] bpfcos kxs[], kx0, ky0, kx1, ky1, kx2, ky2, ...

  NB: x values must be ordered (kx0 < kx1 < kx2 etc)

  See also: bpf, linlin, lincos
    
*/
  
ksmps = 64
nchnls = 1
0dbfs = 1
    
instr 1
  kx line -1, p3, 2.5
  ky bpfcos kx,        \
            0,    0,   \
            1.01, 10,  \
            2,    0.5, \
            2.5,  -1
  printks "kx: %f   ky: %f \n", 0.1, kx, ky
endin

instr 2
  ; test i-time
  ix = 1.2
  iy bpfcos ix, 0,0, 0.5,5, 1,10, 1.5,15, 2,20, 2.5,25, 3,30
  print iy
  turnoff
endin

instr 3
  ; bpfcos also works with arrays
  kx[] fillarray 0, 0.15, 0.25, 0.35, 0.45, 0.55, 0.6
  ky[] bpfcos kx, 0,0, 0.1,10, 0.2,20, 0.3,30, 0.4,40, 0.5,50
  printarray ky, 1, "", "ky="
  turnoff
endin

instr 4
  kpitch bpfcos timeinsts(), 0, 60, 2, 61, 3, 65, 3.5, 60
  a0 oscili 0.5, mtof(kpitch)
  kenv0 linseg 0, 0.5, 1, p3-1, 1, 0.5, 0
  kenv bpfcos kenv0, 0, 0, 0.5, 0.25, 1, 0.7
  a0 *= interp(kenv)
  outch 1, a0
endin

    </CsInstruments>
<CsScore>
i 1 1 3 
i 2 0 -1
i 3 0 -1
i 4 0 5

</CsScore>
</CsoundSynthesizer>
