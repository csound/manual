<!--
id:fmwurlie
category:Signal Generators:FM Synthesis
-->
# fmwurlie
Uses FM synthesis to create a Wurlitzer electric piano sound.

It comes from a family of FM sounds, all using 4 basic oscillators and various architectures, as used in the TX81Z synthesizer.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = fmwurlie(kamp, kfreq, kc1, kc2, kvdepth, kvrate, ifn1, ifn2, ifn3, \
                    ifn4, ivfn)
    ```

=== "Classic"
    ``` csound-orc
    ares fmwurlie kamp, kfreq, kc1, kc2, kvdepth, kvrate, ifn1, ifn2, ifn3, \
                  ifn4, ivfn
    ```

### Initialization

All these opcodes take 5 tables for initialization. The first 4 are the basic inputs and the last is the low frequency oscillator (LFO) used for vibrato. The last table should usually be a sine wave.

The initial waves should be:

* _ifn1_ -- sine wave
* _ifn2_ -- sine wave
* _ifn3_ -- sine wave
* _ifn4_ -- [fwavblnk.aiff](../examples/fwavblnk.aiff)

> :memo: **Note**<br>
>
> The file &#8220;fwavblnk.aiff&#8221; is also available at [ftp://ftp.cs.bath.ac.uk/pub/dream/documentation/sounds/modelling/](ftp://ftp.cs.bath.ac.uk/pub/dream/documentation/sounds/modelling/).

### Performance

_kamp_ -- Amplitude of note.

_kfreq_ -- Frequency of note played.

_kc1, kc2_ -- Controls for the synthesizer:

* _kc1_ -- Mod index 1
* _kc2_ -- Crossfade of two outputs
* _Algorithm_ -- 5

_kvdepth_ -- Vibrator depth

_kvrate_ -- Vibrator rate

## Examples

Here is an example of the fmwurlie opcode. It uses the file [fmwurlie.csd](../examples/fmwurlie.csd), and [fwavblnk.aiff](../examples/fwavblnk.aiff).

``` csound-orc title="Example of the fmwurlie opcode." linenums="1"
--8<-- "examples/fmwurlie.csd"
```

## See Also

[FM Synthesis](../siggen/fmsynth.md)

More information about frequency modulation on Wikipedia: [http://en.wikipedia.org/wiki/Frequency_modulation_synthesis](http://en.wikipedia.org/wiki/Frequency_modulation_synthesis)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47
