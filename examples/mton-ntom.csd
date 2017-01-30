<CsoundSynthesizer>
<CsOptions>
--nosound
</CsOptions>
<CsInstruments>

instr 1
    S4 mton ntom("7D+63")
    puts S4, 1

    S1  mton 60
    puts S1, 1

    S2 mton ftom(442)
    puts S2, 1

    S3 = mton(48.25)
    puts S3, 1

    k1 = ntom("4C")
    printk2 k1

    i2  ntom "4E"
    print i2

    S5 = mton(ntom("4G+"))
    puts S5, 1
    
    turnoff
endin

instr 2
    k1 = ntom("4Eb-31")
    printk2 k1
    i0  ntom "4C+"
    print i0
    i1 = ntom:i("4A")
    print i1    
	turnoff
endin

</CsInstruments>
<CsScore>

i 1 0 1
i 2 0 1

</CsScore>
</CsoundSynthesizer>
