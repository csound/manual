<!--
id:waveset
category:Signal Generators:Sample Playback
-->
# waveset
A simple time stretch by repeating cycles.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = waveset(ain, krep [, ilen])
    ```

=== "Classic"
    ``` csound-orc
    ares waveset ain, krep [, ilen]
    ```

### Initialization

_ilen_ (optional, default=0) -- the length (in samples) of the audio signal. If _ilen_ is set to 0, it defaults to half the given note length (p3).

### Performance

_ain_ -- the input audio signal.

_krep_ -- the number of times the cycle is repeated.

The input is read and each complete cycle (two zero-crossings) is repeated _krep_ times.

There is an internal buffer as the output is clearly slower that the input.  Some care is taken if the buffer is too short, but there may be strange effects.

## Examples

Here is an example of the waveset opcode. It uses the file [waveset.csd](../examples/waveset.csd).

``` csound-csd title="Example of the waveset opcode." linenums="1"
--8<-- "examples/waveset.csd"
```

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Author: John ffitch<br>
February 2001<br>

New in version 4.11
