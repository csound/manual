<CsoundSynthesizer>
<CsOptions>
-odac     // realtime audio out
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 8
0dbfs  = 1

/*
In instrument #1, a simple example of spatialization is applied to
a sinusoidal signal with a virtual source moving along the azimuth,
sequentially traversing all eight channels.
*/

instr 1
    asig = poscil(expseg:k(0.001, p3/2, 0.7, p3/2, .0001), 440) // test signal

    // define source
    source:k[] = [phasor:k(0.3) * 360, 0.0] // source position in degree with variable azimuth

    // set loudspeker positions
    lpos:i[][] = init(8, 2) // 8 channels 2D
    lpos = [0, 0, 45, 0, 90, 0, 135, 0, 180, 0, 225, 0, 270, 0, 315, 0]

    // define array of out channels
    smooth_decay:k = 3 // variable smooth_decay
    rolloff:i = 24.0 // rolloff
    dbap_sig:a[] = init(8) // out 8 channels
    dbap_sig = dbap(asig, 1, source, lpos, smooth_decay, rolloff) // process with

    out(dbap_sig)
endin
</CsInstruments>
<CsScore>

i 1 0 10

</CsScore>
</CsoundSynthesizer>
