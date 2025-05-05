<!--
id:out
category:Signal I/O:Signal Output
-->
# out
Writes audio data to an external device or stream, either from audio variables or from an audio array.

## Syntax
=== "Modern"
    ``` csound-orc
    out(asig1[, asig2,....])
    out(aarray)
    ```

=== "Classic"
    ``` csound-orc
    out asig1[, asig2,....]
    out aarray
    ```

### Performance

Sends audio samples to an accumulating output buffer (created at the beginning of performance) which serves to collect the output of all active instruments before the sound is written to disk. There can be any number of these output units in an instrument.

In the array case each element of the arrary is sent to the corresponding channel. This provides a way of using many channels.  The nonarray version is limited  to 1999.

The type (mono, stereo, quad, hex, or oct) should agree with [nchnls](../opcodes/nchnls.md). But as of version 3.50, Csound will attempt to change an incorrect opcode to agree with _nchnls_ statement.

## Examples

Here is an example of the out opcode. It uses the file [out.csd](../examples/out.csd).

``` csound-csd title="Example of the out opcode." linenums="1"
--8<-- "examples/out.csd"
```

## See also

[Signal Output](../sigio/output.md)

## Credits

Author: Barry L. Vercoe, Matt Ingalls/Mike Berry<br>
MIT, Mills College<br>
1993-1997<br>
Author: John ffitch<br>
NUIM, 2013<br>

Original in Csound v1

Array version in 6.01
