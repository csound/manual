<!--
id:moog
category:Signal Generators:Models and Emulations
-->
# moog
An emulation of a mini-Moog synthesizer.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = moog(kamp, kfreq, kfiltq, kfiltrate, kvibf, kvamp, iafn, iwfn, ivfn)
    ```

=== "Classic"
    ``` csound-orc
    ares moog kamp, kfreq, kfiltq, kfiltrate, kvibf, kvamp, iafn, iwfn, ivfn
    ```

### Initialization

_iafn, iwfn, ivfn_ -- three table numbers containing the attack waveform (unlooped), the main looping wave form, and the vibrato waveform. The files [mandpluk.aiff](../examples/mandpluk.aiff) and [impuls20.aiff](../examples/impuls20.aiff) are suitable for the first two, and a sine wave for the last.

> :memo: **Note**
>
>  The files &#8220;mandpluk.aiff&#8221; and &#8220;impuls20.aiff&#8221; are also available at [ftp://ftp.cs.bath.ac.uk/pub/dream/documentation/sounds/modelling/](ftp://ftp.cs.bath.ac.uk/pub/dream/documentation/sounds/modelling/).


### Performance

_kamp_ -- Amplitude of note.

_kfreq_ -- Frequency of note played.

_kfiltq_ -- Q of the filter, in the range 0.8 to 0.9

_kfiltrate_ -- rate control for the filter in the range 0 to 0.0002

_kvibf_ -- frequency of vibrato in Hertz. Suggested range is 0 to 12

_kvamp_ -- amplitude of the vibrato

## Examples

Here is an example of the moog opcode. It uses the file [moog.csd](../examples/moog.csd), [mandpluk.aiff](../examples/mandpluk.aiff), and [impuls20.aiff](../examples/impuls20.aiff).

``` csound-orc title="Example of the moog opcode." linenums="1"
--8<-- "examples/moog.csd"
```

## See Also

[Models and Emulations](../siggen/models.md)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47
