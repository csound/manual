<!--
id:outo
category:Signal I/O:Signal Output
-->
# outo
Writes 8-channel audio data to an external device or stream.

## Syntax
=== "Modern"
    ``` csound-orc
    outo(asig1, asig2, asig3, asig4, asig5, asig6, asig7, asig8)
    ```

=== "Classic"
    ``` csound-orc
    outo asig1, asig2, asig3, asig4, asig5, asig6, asig7, asig8
    ```

### Performance

Sends 8-channel audio samples to an accumulating output buffer (created at the beginning of performance) which serves to collect the output of all active instruments before the sound is written to disk. There can be any number of these output units in an instrument.

The type (mono, stereo, quad, hex, or oct) should agree with [nchnls](../opcodes/nchnls.md). But as of version 3.50, Csound will attempt to change an incorrect opcode to agree with _nchnls_ statement.

## See also

[Signal Output](../sigio/output.md)

## Credits

Author: John ffitch

New after 3.30
