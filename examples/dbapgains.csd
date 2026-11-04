<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 8
0dbfs  = 1

/*
In instrument #1, the dbapgains opcode is tested by computing the gain
vector for eight loudspeakers arranged in a circular configuration.
A static source is positioned sequentially at azimuth angles matching
each loudspeaker (0°, 45°, ..., 315°). The gain vector is recalculated
at each step, and the resulting values are printed periodically to
verify that the maximum gain corresponds to the loudspeaker located
at the source position.
*/

instr 1
    ndx_count:k = init(0)

    dbap_gains:k[] = init(8) // init 8 channels gains vector

    // set loudspeaker positions
    lpos:i[][] = init(8, 2)
    lpos = [0, 0, 45, 0, 90, 0, 135, 0, 180, 0, 225, 0, 270, 0, 315, 0] // loudspeker positions

    // define source angle
    azi:i[] = [0, 45, 90, 135, 180, 225, 270, 315]
    source:k[] = [azi[ndx_count], 0.0]

    // solve gain vector
    smooth_decay:k = expseg(0.001, p3 / 2, 5, p3 / 2, 0.0001) // variable smooth_decay
    dbap_gains = dbapgains:k[](1, source, lpos, smooth_decay, 24.0)

    trig:k = metro(5)
    printarray(dbap_gains, trig, "", "GAINS VECTOR = ")

    ndx_count += 1
    ndx_count = ndx_count % 8

endin
</CsInstruments>
<CsScore>

i 1 0 3

</CsScore>
</CsoundSynthesizer>
