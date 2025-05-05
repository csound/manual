<!--
id:fmvoice
category:Signal Generators:FM Synthesis
-->
# fmvoice
FM Singing Voice Synthesis.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = fmvoice(kamp, kfreq, kvowel, ktilt, kvibamt, kvibrate[, ifn1, \
                   ifn2, ifn3, ifn4, ivibfn])
    ```

=== "Classic"
    ``` csound-orc
    ares fmvoice kamp, kfreq, kvowel, ktilt, kvibamt, kvibrate[, ifn1, \
                 ifn2, ifn3, ifn4, ivibfn]
    ```

### Initialization

_ifn1, ifn2, ifn3,ifn3, ivibfn_ -- Tables, usually of sinewaves.  The last is for vibrato

### Performance

_kamp_ -- Amplitude of note.

_kfreq_ -- Frequency of note played.

_kvowel_ -- the vowel being sung, in the range 0-64

_ktilt_ -- the spectral tilt of the sound in the range 0 to 99

_kvibamt_ -- Depth of vibrato

_kvibrate_ -- Rate of vibrato

## Examples

Here is an example of the fmvoice opcode. It uses the file [fmvoice.csd](../examples/fmvoice.csd).

``` csound-orc title="Example of the fmvoice opcode." linenums="1"
--8<-- "examples/fmvoice.csd"
```

## See Also

[FM Synthesis](../siggen/fmsynth.md)

More information about frequency modulation on Wikipedia: [http://en.wikipedia.org/wiki/Frequency_modulation_synthesis](http://en.wikipedia.org/wiki/Frequency_modulation_synthesis)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47
