<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac
; -iadc    ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o biquad-2.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
sr = 44100
kr =  4410
ksmps = 10
nchnls = 2

/*  modal synthesis using biquad filters as oscillators
    Example by Scott Lindroth 2007 */

instr 1
    denom:i = sr*0.5

    ipulseSpd = p4
    cps:i     = p5
    ipan      = p6
    amp:i     = p7
    modes:i   = p8

    pulse:a = mpulse(amp, 0)
    cps     = cpspch(cps)

    ; filter gain

    amp1:i = 600
    amp2:i = 1000
    amp3:i = 1000
    amp4:i = 1000
    amp5:i = 1000
    amp6:i = 1000

    ; resonance

    rpole1:i = 0.99999
    rpole2:i = rpole1
    rpole3:i = rpole1
    rpole4:i = rpole1
    rpole5:i = rpole1
    rpole6:i = rpole1

    ; modal frequencies

    if modes == 1 then
      f1:i = cps * 1            ;pot lid
      f2:i = cps * 6.27
      f3:i = cps * 3.2
      f4:i = cps * 9.92
      f5:i = cps * 14.15
      f6:i = cps * 6.23
    else ;                      ;modes != 1
      f1 = cps * 1              ;uniform wood bar
      f2 = cps * 2.572
      f3 = cps * 4.644
      f4 = cps * 6.984
      f5 = cps * 9.723
      f6 = cps * 12.0
    endif

    ; convert frequency to radian frequency

    theta1:i = (f1/denom) * $M_PI
    theta2:i = (f2/denom) * $M_PI
    theta3:i = (f3/denom) * $M_PI
    theta4:i = (f4/denom) * $M_PI
    theta5:i = (f5/denom) * $M_PI
    theta6:i = (f6/denom) * $M_PI

    ; calculate coefficients

    b11:i = -2 * rpole1 * cos(theta1)
    b21:i = rpole1 * rpole1
    b12:i = -2 * rpole2 * cos(theta2)
    b22:i = rpole2 * rpole2
    b13:i = -2 * rpole3 * cos(theta3)
    b23:i = rpole3 * rpole3
    b14:i = -2 * rpole4 * cos(theta4)
    b24:i = rpole4 * rpole4
    b15:i = -2 * rpole5 * cos(theta5)
    b25:i = rpole5 * rpole5
    b16:i = -2 * rpole6 * cos(theta6)
    b26:i = rpole6 * rpole6

    ;printk(1, b11)
    ;printk(1, b21)

    ;  also try setting the -1 coeff. to 0, but be sure to scale down the amplitude!

    sin1:a = biquad(pulse * amp1, 1, 0, -1, 1, b11, b21)
    sin2:a = biquad(pulse * amp2, 1, 0, -1, 1, b12, b22)
    sin3:a = biquad(pulse * amp3, 1, 0, -1, 1, b13, b23)
    sin4:a = biquad(pulse * amp4, 1, 0, -1, 1, b14, b24)
    sin5:a = biquad(pulse * amp5, 1, 0, -1, 1, b15, b25)
    sin6:a = biquad(pulse * amp6, 1, 0, -1, 1, b16, b26)

    afin = (sin1 + sin2 + sin3 + sin4 + sin5 + sin6)

    outs(afin * sqrt(ipan), afin*sqrt(1-ipan))

endin
</CsInstruments>
<CsScore>
;ins     st    dur  pulseSpd   pch    pan    amp    modes
i1        0    12    0       7.089    0      0.7    2
i1        .    .    .        7.09     1      .      .
i1        .    .    .        7.091    0.5    .      .

i1        0    12    0       8.039    0      0.7    2
i1        0    12    0       8.04     1      0.7    2
i1        0    12    0       8.041    0.5    0.7    2

i1        9    .    .        7.089    0      .      2
i1        .    .    .        7.09     1      .      .
i1        .    .    .        7.091    0.5    .      .

i1        9    12    0       8.019    0      0.7    2
i1        9    12    0       8.02     1      0.7    2
i1        9    12    0       8.021    0.5    0.7    2
e
</CsScore>
</CsoundSynthesizer>