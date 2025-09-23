<!--
id:lposcila
category:Signal Generators:Sample Playback
-->
# lposcila
Read sampled sound from a table with looping and high precision.

## Syntax
=== "Modern"
    ``` csound-orc
    ar = lposcila(aamp, kfreqratio, kloop, kend, ift [,iphs])
    ```

=== "Classic"
    ``` csound-orc
    ar lposcila aamp, kfreqratio, kloop, kend, ift [,iphs]
    ```

### Initialization

_ift_ -- function table number

_iphs_ -- initial phase (in samples)

### Performance

_ar_ -- output signal

_aamp_ -- amplitude

_kfreqratio_ -- multiply factor of table frequency (for example: 1 = original frequency, 1.5 = a fifth up , .5 = an octave down)

_kloop_ -- start loop point (in samples)

_kend_ -- end loop point (in samples)

_lposcila_ is the same as [lposcil](../opcodes/lposcil.md), but has an audio-rate amplitude argument (instead of k-rate) to allow fast envelope transients.

## Examples

Here is an example of the lposcila opcode. It uses the file [lposcila.csd](../examples/lposcila.csd).

``` csound-csd title="Example of the lposcila opcode." linenums="1"
--8<-- "examples/lposcila.csd"
```

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Author: Gabriel Maldonado

New in version 5.06
