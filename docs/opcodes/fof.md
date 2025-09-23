<!--
id:fof
category:Signal Generators:Granular Synthesis
-->
# fof
Produces sinusoid bursts useful for formant and granular synthesis.

Audio output is a succession of sinusoid bursts initiated at frequency _xfund_ with a spectral peak at _xform_. For _xfund_ above 25 Hz these bursts produce a speech-like formant with spectral characteristics determined by the k-input parameters. For lower fundamentals this generator provides a special form of granular synthesis.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = fof(xamp, xfund, xform, koct, kband, kris, kdur, kdec, iolaps, \
               ifna, ifnb, itotdur [, iphs] [, ifmode] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares fof xamp, xfund, xform, koct, kband, kris, kdur, kdec, iolaps, \
             ifna, ifnb, itotdur [, iphs] [, ifmode] [, iskip]
    ```

### Initialization

_iolaps_ -- number of preallocated spaces needed to hold overlapping burst data. Overlaps are frequency dependent, and the space required depends on the maximum value of _xfund * kdur_. Can be over-estimated at no computation cost. Uses less than 50 bytes of memory per _iolap_.

_ifna, ifnb_ -- table numbers of two stored functions. The first is a sine table for sineburst synthesis (size of at least 4096 recommended). The second is a rise shape, used forwards and backwards to shape the sineburst rise and decay; this may be linear ([GEN07](../scoregens/gen07.md)) or perhaps a sigmoid ([GEN19](../scoregens/gen19.md)).

_itotdur_ -- total time during which this _fof_ will be active. Normally set to p3. No new sineburst is created if it cannot complete its _kdur_ within the remaining _itotdur_.

_iphs_ (optional, default=0) -- initial phase of the fundamental, expressed as a fraction of a cycle (0 to 1). The default value is 0.

_ifmode_ (optional, default=0) -- formant frequency mode. If zero, each sineburst keeps the _xform_ frequency it was launched with. If non-zero, each is influenced by _xform_ continuously. The default value is 0.

_iskip_ (optional, default=0) -- If non-zero, skip initialisation (allows legato use).

### Performance

_xamp_ -- peak amplitude of each sineburst, observed at the true end of its rise pattern. The rise may exceed this value given a large bandwidth (say, Q &lt; 10) and/or when the bursts are overlapping.

_xfund_ -- the fundamental frequency (in Hertz) of the impulses that create new sinebursts.

_xform_ -- the formant frequency, i.e. freq of the sinusoid burst induced by each _xfund_ impulse. This frequency can be fixed for each burst or can vary continuously (see _ifmode_).

_koct_ -- octaviation index, normally zero. If greater than zero, lowers the effective _xfund_ frequency by attenuating odd-numbered sinebursts. Whole numbers are full octaves, fractions transitional.

_kband_ -- the formant bandwidth (at -6dB), expressed in Hz. The bandwidth determines the rate of exponential decay throughout the sineburst, before the enveloping described below is applied.

_kris, kdur, kdec_ -- rise, overall duration, and decay times (in seconds) of the sinusoid burst. These values apply an enveloped duration to each burst, in similar fashion to a Csound _linen_ generator but with rise and decay shapes derived from the _ifnb_ input. _kris_ inversely determines the skirtwidth (at -40 dB) of the induced formant region. _kdur_ affects the density of sineburst overlaps, and thus the speed of computation. Typical values for vocal imitation are .003,.02,.007.

Csound's _fof_ generator is loosely based on Michael Clarke's C-coding of IRCAM's _CHANT_ program (Xavier Rodet et al.). Each fof produces a single formant, and the output of four or more of these can be summed to produce a rich vocal imitation. _fof_ synthesis is a special form of granular synthesis, and this implementation aids transformation between vocal imitation and granular textures. Computation speed depends on _kdur, xfund_, and the density of any overlaps.

## Examples

Here is an example of the fof opcode. It uses the file [fof.csd](../examples/fof.csd).

``` csound-orc title="Example of the fof opcode." linenums="1"
--8<-- "examples/fof.csd"
```

The formant values for the alto-"a" sound were taken from the [Formant Values Appendix](../misc/formants.md).

Two musical examples featuring the fof opcode: [TheElectricPriest_Enhus.csd](../examples/musical/TheElectricPriest_Enhus.csd) by Tobias Enhus, and [BuzzFof_Cucchi.csd](../examples/musical/BuzzFof_Cucchi.csd) by Stefano Cucchi.

## See Also

[Granular Synthesis](../siggen/granular.md)

## Credits

Added in version 1 (1990)
