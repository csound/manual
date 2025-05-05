<!--
id:vpvoc
category:Spectral Processing:STFT
-->
# vpvoc
Implements signal reconstruction using an fft-based phase vocoder and an extra envelope.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = vpvoc(ktimpnt, kfmod, ifile [, ispecwp] [, ifn])
    ```

=== "Classic"
    ``` csound-orc
    ares vpvoc ktimpnt, kfmod, ifile [, ispecwp] [, ifn]
    ```

### Initialization

_ifile_ -- the pvoc number (n in pvoc.n) or the name in quotes of the analysis file made using [pvanal](../utility/pvanal.md). (See [pvoc](../opcodes/pvoc.md).)

_ispecwp_ (optional, default=0) -- if non-zero, attempts to preserve the spectral envelope while its frequency content is varied by _kfmod_. The default value is zero.

_ifn_ (optional, default=0) -- optional function table containing control information for _vpvoc_. If _ifn_ = 0, control is derived internally from a previous _tableseg_ or _tablexseg_ unit. Default is 0. (New in Csound version 3.59)

### Performance

_ktimpnt_ -- The passage of time, in seconds, through the analysis file. _ktimpnt_ must always be positive, but can move forwards or backwards in time, be stationary or discontinuous, as a pointer into the analysis file.

_kfmod_ -- a control-rate transposition factor: a value of 1 incurs no transposition, 1.5 transposes up a perfect fifth, and .5 down an octave.

This implementation of _pvoc_ was orignally written by Dan Ellis. It is based in part on the system of Mark Dolson, but the pre-analysis concept is new. The  spectral extraction and amplitude gating (new in Csound version 3.56) were added by Richard Karpen based on functions in SoundHack by Tom Erbe.

_vpvoc_ is identical to [pvoc](../opcodes/pvoc.md) except that it takes the result of a previous [tableseg](../opcodes/tableseg.md) or [tablexseg](../opcodes/tablexseg.md) and uses the resulting function table (passed internally to the _vpvoc_), as an envelope over the magnitudes of the analysis data channels. Optionally, a table specified by _ifn_ may be used.

The result is spectral enveloping. The function size used in the _tableseg_ should be _framesize/2,_ where framesize is the number of bins in the phase vocoder analysis file that is being used by the _vpvoc_. Each location in the table will be used to scale a single analysis bin. By using different functions for _ifn1_, _ifn2_, etc.. in the _tableseg_, the spectral envelope becomes a dynamically changing one. See also [tableseg](../opcodes/tableseg.md) and [tablexseg](../opcodes/tablexseg.md).

## Examples

The following example, using _vpvoc_, shows the use of functions such as

``` csound-sco
ff 1 0 256 5 .001 128 1 128 .001
f 2 0 256 5 1 128 .001 128 1
f 3 0 256 7 1 256 1
```

to scale the amplitudes of the separate analysis bins.

``` csound-orc
ktime   line         0, p3, 3 ; time pointer, in seconds, into file
        tablexseg    1, p3*0.5, 2, p3*0.5, 3
apv     vpvoc        ktime, 1, "pvoc.file"
```

The result would be a time-varying &#8220;spectral envelope&#8221; applied to the phase vocoder analysis data. Since this amplifies or attenuates the amount of signal at the frequencies that are paired with the amplitudes which are scaled by these functions, it has the effect of applying very accurate filters to the signal. In this example the first table would have the effect of a band-pass filter, gradually be band-rejected over half the note's duration, and then go towards no modification of the magnitudes over the second half.

Here is a complete example of the vpvoc opcode. It uses the file [vpvoc.csd](../examples/vpvoc.csd).

``` csound-csd linenums="1"
--8<-- "examples/vpvoc.csd"
```

## See Also

[Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md)

## Credits

Authors: Dan Ellis and Richard Karpen<br>
Seattle, WA USA<br>
1997<br>

New in version 3.44
