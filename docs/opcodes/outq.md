<!--
id:outq
category:Signal I/O:Signal Output
-->
# outq
Writes 4-channel audio data to an external device or stream.

## Syntax
=== "Modern"
    ``` csound-orc
    outq(asig1, asig2, asig3, asig4)
    ```

=== "Classic"
    ``` csound-orc
    outq asig1, asig2, asig3, asig4
    ```

### Performance

Sends 4-channel audio samples to an accumulating output buffer (created at the beginning of performance) which serves to collect the output of all active instruments before the sound is written to disk. There can be any number of these output units in an instrument.

The type (mono, stereo, quad, hex, or oct) should agree with [nchnls](../opcodes/nchnls.md). But as of version 3.50, Csound will attempt to change an incorrect opcode to agree with the _nchnls_ statement. Opcodes can be chosen to direct sound to any particular channel: _outs1_ sends to stereo channel 1, _outq3_ to quad channel 3, etc.

## Examples

Here is an example of the outq opcode. It uses the file [outq.csd](../examples/outq.csd).

``` csound-csd title="Example of the outq opcode." linenums="1"
--8<-- "examples/outq.csd"
```

## See also

[Signal Output](../sigio/output.md)

## Credits

Author: Barry L. Vercoe, Matt Ingalls/Mike Berry<br>
MIT, Mills College<br>
1993-1997<br>
