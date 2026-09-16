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

_ifn1, ifn2, ifn3, ifn4, ivibfn_ -- Optional waveform tables, usually sine waves. The first four are for the FM operators; the last is for vibrato.

### Performance

_kamp_ -- Amplitude of note.

_kfreq_ -- Frequency of the note in Hz. It must be positive and finite.

_kvowel_ -- Vowel selection, in the range 0–127. Each bank uses the same 32 vowel and phoneme entries with a different scale for their formant frequencies:

| Selection | Formant frequency scale |
| --- | --- |
| 0–31 | 0.9 |
| 32–63 | 1.0 |
| 64–95 | 1.1 |
| 96–127 | 1.2 |

For example, 1, 33, 65, and 97 select the same entry at four scales. Values outside 0–127 are clamped, and fractional values select the integer below them; adjacent entries are not interpolated.

_ktilt_ -- Timbre control, with a nominal range of 0–127. Larger values increase the shared FM modulator's level. The control maps to 100 gain steps; values below or above the range use the lowest or highest step.

_kvibamt_ -- Depth of vibrato. With a vibrato table whose peak amplitude is 1, a value of 1 gives a peak frequency deviation of 10%. A value of 0 disables vibrato.

_kvibrate_ -- Rate of vibrato in Hz.

## Examples

Here is an example of the fmvoice opcode. It uses the file [fmvoice.csd](../examples/fmvoice.csd).

``` csound-orc title="Example of the fmvoice opcode." linenums="1"
--8<-- "examples/fmvoice.csd"
```
```

## See Also

[FM Synthesis](../siggen/fmsynth.md)

More information about frequency modulation on Wikipedia: [http://en.wikipedia.org/wiki/Frequency_modulation_synthesis](http://en.wikipedia.org/wiki/Frequency_modulation_synthesis)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47
