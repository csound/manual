<!--
id:expsega
category:Signal Generators:Linear and Exponential Generators
-->
# expsega
An exponential segment generator operating at a-rate.

This is the audio-only form of [expseg](../opcodes/expseg.md). Both use sample timing at audio rate.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = expsega(ia, idur1, ib [, idur2] [, ic] [...])
    ```

=== "Classic"
    ``` csound-orc
    ares expsega ia, idur1, ib [, idur2] [, ic] [...]
    ```

### Initialization

_ia_ -- starting value. Zero is illegal.

_ib_, _ic_, etc. -- value after _idur1_ seconds, etc. must be non-zero and must agree in sign with _ia_.

_idur1_ -- duration in seconds of first segment. A zero or negative value will cause all initialization to be skipped.

_idur2_, _idur3_, etc. -- duration in seconds of subsequent segments. A zero or negative value will terminate the initialization process with the preceding point, permitting the last defined line or curve to be continued indefinitely in performance. The default is zero.

### Performance

The magnitude changes by a constant factor within each segment. All points must be non-zero and have the same sign; negative points are allowed. Segment lengths round to the nearest whole samples.

If the note ends before the segments finish, the curve stops. If the note continues, the final segment keeps the same exponential rate beyond its stated endpoint.

## Examples

Here is an example of the expsega opcode. It uses the file [expsega.csd](../examples/expsega.csd).

``` csound-csd title="Example of the expsega opcode." linenums="1"
--8<-- "examples/expsega.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: Gabriel Maldonado

New in Csound 3.57
