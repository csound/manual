<!--
id:fmb3
category:Signal Generators:FM Synthesis
-->
# fmb3
Uses FM synthesis to create a Hammond B3 organ sound.

It comes from a family of FM sounds, all using 4 basic oscillators and various architectures, as used in the TX81Z synthesizer.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = fmb3(kamp, kfreq, kc1, kc2, kvdepth, kvrate[, ifn1, ifn2, ifn3, \
                ifn4, ivfn])
    ```

=== "Classic"
    ``` csound-orc
    ares fmb3 kamp, kfreq, kc1, kc2, kvdepth, kvrate[, ifn1, ifn2, ifn3, \
              ifn4, ivfn]
    ```

### Initialization

_fmb3_ takes 5 tables for initialization. The first 4 are the basic inputs and the last is the low frequency oscillator (LFO) used for vibrato. The last table should usually be a sine wave.  These all default to a sine wave table.

The initial waves should be:

* _ifn1_ -- sine wave
* _ifn2_ -- sine wave
* _ifn3_ -- sine wave
* _ifn4_ -- sine wave

### Performance

_kamp_ -- Amplitude of note.

_kfreq_ -- Frequency of note played.

_kc1, kc2_ -- Controls for the synthesizer:

* _kc1_ -- Total mod index
* _kc2_ -- Crossfade of two modulators
* _Algorithm_ -- 4

_kvdepth_ -- Vibrator depth

_kvrate_ -- Vibrator rate

## Examples

Here is an example of the fmb3 opcode. It uses the file [fmb3.csd](../examples/fmb3.csd).

``` csound-orc title="Example of the fmb3 opcode." linenums="1"
--8<-- "examples/fmb3.csd"
```

## See Also

[FM Synthesis](../siggen/fmsynth.md)

More information about frequency modulation on Wikipedia: [http://en.wikipedia.org/wiki/Frequency_modulation_synthesis](http://en.wikipedia.org/wiki/Frequency_modulation_synthesis)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47
