<CsoundSynthesizer>
<CsOptions>
-d -o dac
</CsOptions>
<CsInstruments>
ksmps = 64

instr 1
  fftsize:i = 1024
  cnt:k = init(0)
  In:k[] = init(fftsize)
  Out:k[] = init(fftsize)

  a1 = oscili(0dbfs/2, 440)

  if cnt >= fftsize then
    Cmplx:k[] = r2c(In)
    Spec:k[] = fft(Cmplx)
    Cmplx = fftinv(Spec)
    Out = c2r(Cmplx)
    cnt = 0 
  endif

  In = shiftin(a1)
  a2 = shiftout(Out)
  cnt += ksmps
  out(a2)
endin
</CsInstruments>
<CsScore>
i1 0 10
</CsScore>
</CsoundSynthesizer>