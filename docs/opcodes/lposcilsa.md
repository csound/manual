<!--
id:lposcilsa
category:Signal Generators:Sample Playback
-->
# lposcilsa
Read stereo sampled sound from a table with looping and high precision.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1, ar2 = lposcilsa(aamp, kfreqratio, kloop, kend, ift [,iphs])
    ```

=== "Classic"
    ``` csound-orc
    ar1, ar2 lposcilsa aamp, kfreqratio, kloop, kend, ift [,iphs]
    ```

### Initialization

_ift_ -- function table number

_iphs_ -- initial phase (in samples)

### Performance

_ar1, ar2_ -- output signal

_aamp_ -- amplitude

_kfreqratio_ -- multiply factor of table frequency (for example: 1 = original frequency, 1.5 = a fifth up , .5 = an octave down)

_kloop_ -- start loop point (in samples)

_kend_ -- end loop point (in samples)

_lposcilsa_ is the same as [lposcila](../opcodes/lposcila.md), but works with stereo files loaded with [GEN01](../scoregens/gen01.md).

## Examples

Here is an example of the lposcilsa opcode. It uses the file [lposcilsa.csd](../examples/lposcilsa.csd).

``` csound-csd title="Example of the lposcilsa opcode." linenums="1"
--8<-- "examples/lposcilsa.csd"
```

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Author: Gabriel Maldonado

New in version 5.06
