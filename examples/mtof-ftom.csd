<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1
A4 = 440

instr 1
    kfreq = mtof(69)
    printks2 "midi 69   -> %f\n", kfreq

    kmidi = ftom(442)
    printks2 "freq 442  -> %f\n", kmidi

    kmidr = ftom(442,1)
    printks2 "freq 442  -> %f rounded\n", kmidr

    kfreq = mtof(kmidi)
    printks "midi %f -> %f\n", 1, kmidi, kfreq

    imidi = ftom:i(440)
    print imidi

    ifreq = mtof:i(60)
    print ifreq
    

    
    turnoff
endin

</CsInstruments>
<CsScore>
i 1 0 1
</CsScore>
</CsoundSynthesizer>
