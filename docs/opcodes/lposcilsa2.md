<!--
id:lposcilsa2
category:Signal Generators:Sample Playback
-->
# lposcilsa2
Read stereo sampled sound from a table with looping and high precision.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1, ar2 = lposcilsa2(aamp, kfreqratio, kloop, kend, ift [,iphs])
    ```

=== "Classic"
    ``` csound-orc
    ar1, ar2 lposcilsa2 aamp, kfreqratio, kloop, kend, ift [,iphs]
    ```

### Initialization

_ift_ -- function table number.

_iphs_ -- initial phase (in samples).

### Performance

_ar1, ar2_ -- output signal.

_aamp_ -- amplitude.

_kfreqratio_ -- multiply factor of table frequency (for example: 1 = original frequency, 2 = an octave up). Only integers are allowed.

_kloop_ -- start loop point (in samples).

_kend_ -- end loop point (in samples).

_lposcilsa2_ is the same as [lposcilsa](../opcodes/lposcilsa.md), but no interpolation is implemented and only works with integer _kfreqratio_ values. Much faster than [lposcilsa](../opcodes/lposcilsa.md), it is mainly intended to be used with _kfreqratio_ = 1, being in this case a fast substitute of [soundin](../opcodes/soundin.md), since the soundfile must be entirely loaded in memory.

## Examples

Here is an example of the lposcilsa2 opcode. It uses the file [lposcilsa2.csd](../examples/lposcilsa2.csd).

``` csound-csd title="Example of the lposcilsa2 opcode." linenums="1"
--8<-- "examples/lposcilsa2.csd"
```

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Author: Gabriel Maldonado

New in version 5.06
