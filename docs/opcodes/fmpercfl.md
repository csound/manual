<!--
id:fmpercfl
category:Signal Generators:FM Synthesis
-->
# fmpercfl
Uses FM synthesis to create a percussive flute sound.

It comes from a family of FM sounds, all using 4 basic oscillators and various architectures, as used in the TX81Z synthesizer.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = fmpercfl(kamp, kfreq, kc1, kc2, kvdepth, kvrate[, ifn1, ifn2, \
                    ifn3, ifn4, ivfn])
    ```

=== "Classic"
    ``` csound-orc
    ares fmpercfl kamp, kfreq, kc1, kc2, kvdepth, kvrate[, ifn1, ifn2, \
                  ifn3, ifn4, ivfn]
    ```

### Initialization

All these opcodes take 5 tables for initialization. The first 4 are the basic inputs and the last is the low frequency oscillator (LFO) used for vibrato. These all default to a sine wave table.

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

Here is an example of the fmpercfl opcode. It uses the file [fmpercfl.csd](../examples/fmpercfl.csd).

``` csound-orc title="Example of the fmpercfl opcode." linenums="1"
--8<-- "examples/fmpercfl.csd"
```

## See Also

[FM Synthesis](../siggen/fmsynth.md)

More information about frequency modulation on Wikipedia: [http://en.wikipedia.org/wiki/Frequency_modulation_synthesis](http://en.wikipedia.org/wiki/Frequency_modulation_synthesis)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47
