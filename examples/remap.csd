<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

; Prints how remap reads one table with each interpolation mode and with
; each out-of-bounds policy. Nothing is rendered.

instr 1
  ; breakpoints (0, 0), (1, 2), (3, 2), (4, 6): the middle segment is flat
  xs:i[] = fillarray(0, 1, 3, 4)
  ys:i[] = fillarray(0, 2, 2, 6)

  ; inputs inside the table, given as one k-rate array
  probe:k[] = fillarray(0.25, 1, 2, 3.75)

  ; mode: 0 linear, 1 nearest, 2 previous, 3 next, 4 cubic (PCHIP)
  lin:k[]  = remap(probe, xs, ys, 0, 1)
  near:k[] = remap(probe, xs, ys, 1, 1)
  prev:k[] = remap(probe, xs, ys, 2, 1)
  next:k[] = remap(probe, xs, ys, 3, 1)
  cub:k[]  = remap(probe, xs, ys, 4, 1)

  printf("x          %6.3f %6.3f %6.3f %6.3f\n", 1, probe[0], probe[1], probe[2], probe[3])
  printf("linear     %6.3f %6.3f %6.3f %6.3f\n", 1, lin[0], lin[1], lin[2], lin[3])
  printf("nearest    %6.3f %6.3f %6.3f %6.3f\n", 1, near[0], near[1], near[2], near[3])
  printf("previous   %6.3f %6.3f %6.3f %6.3f\n", 1, prev[0], prev[1], prev[2], prev[3])
  printf("next       %6.3f %6.3f %6.3f %6.3f\n", 1, next[0], next[1], next[2], next[3])
  printf("cubic      %6.3f %6.3f %6.3f %6.3f\n\n", 1, cub[0], cub[1], cub[2], cub[3])

  ; inputs outside the table: bounds 1 clamp, 2 fill, 3 extrapolate
  ; (bounds 0 would stop the instrument with a performance error)
  out:k[] = fillarray(-1, 5)
  clamp:k[] = remap(out, xs, ys, 0, 1)
  fill:k[]  = remap(out, xs, ys, 0, 2, -100)
  extl:k[]  = remap(out, xs, ys, 0, 3)
  extc:k[]  = remap(out, xs, ys, 4, 3)

  printf("x                 %8.3f %8.3f\n", 1, out[0], out[1])
  printf("clamp             %8.3f %8.3f\n", 1, clamp[0], clamp[1])
  printf("fill -100         %8.3f %8.3f\n", 1, fill[0], fill[1])
  printf("extrapolate lin.  %8.3f %8.3f\n", 1, extl[0], extl[1])
  printf("extrapolate cub.  %8.3f %8.3f\n", 1, extc[0], extc[1])

  ; one control period is enough
  turnoff
endin
</CsInstruments>
<CsScore>
i 1 0 1
e
</CsScore>
</CsoundSynthesizer>
