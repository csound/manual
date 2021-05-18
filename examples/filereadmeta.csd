<CsoundSynthesizer>
<CsOptions>
--nosound

</CsOptions>

<CsInstruments>
/*
    Svalue filereadmeta Ssndfile, Skey
 
*/

instr 1
    Scomment filereadmeta "sfwithmeta.flac", "comment"
    prints "Comment: %s\n", Scomment
    Stitle filereadmeta "sfwithmeta.flac", "artist"
    prints "Artist: %s\n", Stitle
    turnoff
endin

instr 2
    Skeys[], Svalues[] filereadmeta "sfwithmeta.flac"
    i0 = 0
    while i0 < lenarray(Skeys) do
      prints "%s = %s\n", Skeys[i0], Svalues[i0]
      i0 += 1
    od
endin

</CsInstruments>

<CsScore>

i1 0 0.1
i2 0 0.1
</CsScore>
</CsoundSynthesizer>
