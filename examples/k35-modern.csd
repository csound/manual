<CsoundSynthesizer>
<CsOptions>
  -o dac
</CsOptions>
; ==============================================
<CsInstruments>

sr     = 48000
ksmps  = 1
nchnls = 2
0dbfs  = 1

;; test instruments to demo filter cutoff sweep with high resonance

instr 1 
  sig:a = vco2(0.5, cps2pch(6.00, 12))
  sig = k35lpf(sig, expseg:a(10000, p3, 30), 9.9, 0, 1)
  sig *= 0.25
  sig = limit(sig, -1.0, 1.0)
  out(sig, sig)
endin

instr 2 
  sig:a = vco2(0.5, cps2pch(6.00, 12))
  sig = k35lpf(sig, expseg:k(10000, p3, 30), 9.9, 0, 1)
  sig *= 0.25
  sig = limit(sig, -1.0, 1.0)
  out(sig, sig)
endin

instr 3 
  sig:a = vco2(0.5, cps2pch(6.00, 12))
  sig = k35hpf(sig, expseg:a(10000, p3, 30), 9.9, 0, 1)
  sig *= 0.25
  sig = limit(sig, -1.0, 1.0)
  out(sig, sig)
endin

instr 4 
  sig:a = vco2(0.5, cps2pch(6.00, 12))
  sig = k35hpf(sig, expseg:k(10000, p3, 30), 9.9, 0, 1)
  sig *= 0.25
  sig = limit(sig, -1.0, 1.0)
  out(sig, sig)
endin

;; beat instruments

instr ms20_drum
  pch:i = cps2pch(p4, 12)
  amp:i = ampdbfs(p5)
  env:a = expseg(10000, 0.05, pch, p3 - 0.05, pch)

  sig:a = rand(-1.0, 1.0)
  sig = k35hpf(sig, 60, 7, 1, 1)
  sig = k35lpf(sig, env, 9.8, 1, 1)

  sig = tanh(sig * 16)
  sig *= expon(amp, p3, 0.0001)
  out(sig, sig)
endin

instr ms20_bass 
  pch:i = cps2pch(p4, 12)
  amp:i = ampdbfs(p5)
  env:a = expseg(1000, 0.1, pch * 2, p3 - 0.05, pch * 2)

  sig:a = vco2(1.0, pch)
  sig = k35hpf(sig, pch, 5, 0, 1)
  sig = k35lpf(sig, env, 8, 0, 1)

  sig *= expon(amp, p3, 0.0001) * 0.8
  out(sig, sig)
endin

;; perf code

Tempo@global:k = init(122)

opcode beat_dur():(i)
  xout(60 / i(Tempo)) 
endop

instr bass_player
  dur:i = beat_dur() / int(random(1, 3)) 
  pch:i = 6.00 + int(random(1,3)) + int(random(1,3)) / 100

  schedule("ms20_bass", 0, dur, pch, -11) 

  if (p2 < 37.5) then
    schedule("bass_player", dur, 0.1)
  endif
  turnoff()
endin

instr beat_player 
  step_total:i = p4 
  step:i = step_total % 16

  if step % 4 == 0 then
    pch:i = ((step_total % 128) < 112) ? 4.00 : 8.00
    amp:i = (step == 0)  ? -9 : -12
    schedule("ms20_drum", 0, 0.5, pch, amp)
  endif

  schedule("ms20_drum", 0, 0.125, 14.00, 
           (step % 4 == 0) ? -12 : -18)

  if p2 < 37.5 then
    schedule("beat_player", beat_dur() / 4, 0.1, step_total + 1)
  endif
  turnoff()
endin

;; start play of beats

instr start_beats
  schedule("beat_player", 0, 0.1, 0)
  schedule("bass_player", 0, 0.1)
endin

</CsInstruments>
; ==============================================
<CsScore>
i1 0 5.0
i2 5 5.0
i3 10 5.0
i4 15 5.0

i "start_beats" 22 0.5 0

</CsScore>
</CsoundSynthesizer>
