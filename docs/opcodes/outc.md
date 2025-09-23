<!--
id:outc
category:Signal I/O:Signal Output
-->
# outc
Writes audio data with an arbitrary number of channels to an external device or stream.

## Syntax
=== "Modern"
    ``` csound-orc
    outc(asig1 [, asig2] [...])
    ```

=== "Classic"
    ``` csound-orc
    outc asig1 [, asig2] [...]
    ```

### Performance

_outc_ outputs as many channels as provided.  Any channels greater than [nchnls](../opcodes/nchnls.md) are ignored. Zeros are added as necessary

## Examples

Here is an example of the outc opcode. It uses the file [outc.csd](../examples/outc.csd).

``` csound-csd title="Example of the outc opcode." linenums="1"
--8<-- "examples/outc.csd"
```

## See also

[Signal Output](../sigio/output.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
May 2000<br>

New in Csound Version 4.07
