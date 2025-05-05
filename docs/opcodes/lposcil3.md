<!--
id:lposcil3
category:Signal Generators:Sample Playback
-->
# lposcil3
Read sampled sound (mono or stereo) from a table, with looping, and high precision.

_lposcil3_ uses cubic interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = lposcil3(kamp, kfreqratio, kloop, kend, ifn [, iphs])
    ```

=== "Classic"
    ``` csound-orc
    ares lposcil3 kamp, kfreqratio, kloop, kend, ifn [, iphs]
    ```

### Initialization

_ifn_ -- function table number

### Performance

_kamp_ -- amplitude

_kfreqratio_ -- multiply factor of table frequency (for example: 1 = original frequency, 1.5 = a fifth up , .5 = an octave down)

_kloop_ -- start loop point (in samples)

_kend_ -- end loop point (in samples)

_lposcil3_ (looping precise oscillator) allows varying at k-rate, the starting and ending point of a sample contained in a table ([GEN01](../scoregens/gen01.md)). This can be useful when reading a sampled loop of a wavetable, where repeat speed can be varied during the performance.

## Examples

Here is an example of the lposcil3 opcode. It uses the file [lposcil3.csd](../examples/lposcil3.csd).

``` csound-csd title="Example of the lposcil3 opcode." linenums="1"
--8<-- "examples/lposcil3.csd"
```

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.52
