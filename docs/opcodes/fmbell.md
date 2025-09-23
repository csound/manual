<!--
id:fmbell
category:Signal Generators:FM Synthesis
-->
# fmbell
Uses FM synthesis to create a tublar bell sound.

It comes from a family of FM sounds, all using 4 basic oscillators and various architectures, as used in the TX81Z synthesizer.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = fmbell(kamp, kfreq, kc1, kc2, kvdepth, kvrate[, ifn1, ifn2, ifn3, \
                  ifn4, ivfn, isus])
    ```

=== "Classic"
    ``` csound-orc
    ares fmbell kamp, kfreq, kc1, kc2, kvdepth, kvrate[, ifn1, ifn2, ifn3, \
                ifn4, ivfn, isus]
    ```

### Initialization

All these opcodes take 5 tables for initialization. The first 4 are the basic inputs and the last is the low frequency oscillator (LFO) used for vibrato. These all default to a siewave table.

The initial waves should be:

* _ifn1_ -- sine wave
* _ifn2_ -- sine wave
* _ifn3_ -- sine wave
* _ifn4_ -- sine wave

The optional argument _isus_ controls how long the sound lasts, or how quickly it decays.  It defaults to 4.

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

Here is an example of the fmbell opcode. It uses the file [fmbell.csd](../examples/fmbell.csd).

``` csound-orc title="Example of the fmbell opcode." linenums="1"
--8<-- "examples/fmbell.csd"
```

## See Also

[FM Synthesis](../siggen/fmsynth.md)

More information about frequency modulation on Wikipedia: [http://en.wikipedia.org/wiki/Frequency_modulation_synthesis](http://en.wikipedia.org/wiki/Frequency_modulation_synthesis)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47

Optional argument new in 5.16

More optional argument new in 6.0
