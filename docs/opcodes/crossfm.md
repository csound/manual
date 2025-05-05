<!--
id:crossfm
category:Signal Generators:FM Synthesis
-->
# crossfm

Two oscillators, mutually frequency and/or phase modulated by each other.

## Syntax
=== "Modern"
    ``` csound-orc
    a1, a2 = crossfm(xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2])
    a1, a2 = crossfmi(xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2])
    a1, a2 = crosspm(xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2])
    a1, a2 = crosspmi(xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2])
    a1, a2 = crossfmpm(xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2])
    a1, a2 = crossfmpmi(xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2])
    ```

=== "Classic"
    ``` csound-orc
    a1, a2 crossfm xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2]
    a1, a2 crossfmi xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2]
    a1, a2 crosspm xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2]
    a1, a2 crosspmi xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2]
    a1, a2 crossfmpm xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2]
    a1, a2 crossfmpmi xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2]
    ```

### Initialization

_ifn1_ -- function table number for oscillator #1. Requires a wrap-around guard point.

_ifn2_ -- function table number for oscillator #2. Requires a wrap-around guard point.

_iphs1_ (optional, default=0) -- initial phase of waveform in table _ifn1_, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped.

_iphs2_ (optional, default=0) -- initial phase of waveform in table _ifn2_, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped.

### Performance

_xfrq1_ -- a factor that, when multipled by the _kcps_ parameter, gives the frequency of oscillator #1.

_xfrq2_ -- a factor that, when multipled by the _kcps_ parameter, gives the frequency of oscillator #2.

_xndx1_ -- the index of the modulation of oscillator #2 by oscillator #1.

_xndx2_ -- the index of the modulation of oscillator #1 by oscillator #2.

_kcps_ -- a common denominator, in cycles per second, for both oscillators frequencies.

_crossfm_ implements a crossed frequency modulation algorithm. The audio-rate output of oscillator #1 is used to modulate the frequency input of oscillator #2 while the audio-rate output of oscillator #2 is used to modulate the frequency input of oscillator #1. This double feedback structure produces a rich set of sounds with some chaotic behaviour. _crossfmi_ behaves like _crossfm_ except that linear interpolation is used for table lookup.

_crosspm_ and _crosspmi_ implement cross phase modulation between two oscillators.

_crossfmpm_ and _crossfmpmi_ implement cross frequency/phase modulation between two oscillators. Oscillator #1 is frequency-modulated by oscillator #2 while oscillator #2 is phase-modulated by oscillator #1.

> :warning: **Warning**
>
> Those opcodes may produce very rich spectra, especially with high modulation indexes, and in some cases foldover aliases may occur if the sampling rate is not high enough. Moreover the audio output may vary in function of the sampling rate, due to the non-linearity of the algorithm.

## Examples

Here is an example of the crossfm opcode. It uses the file
[crossfm.csd](../examples/crossfm.csd).

``` csound-orc title="Example of the crossfm opcode." linenums="1"
--8<-- "examples/crossfm.csd"
```

## See Also

[FM Synthesis](../siggen/fmsynth.md)

More information about frequency modulation on Wikipedia: [http://en.wikipedia.org/wiki/Frequency_modulation_synthesis](http://en.wikipedia.org/wiki/Frequency_modulation_synthesis)

More information on these opcodes: [http://www.csoundjournal.com/issue12/crossfm.html](http://www.csoundjournal.com/issue12/crossfm.html).

## Credits

Author: François Pinot<br>
2005-2009<br>

New in version 5.12
