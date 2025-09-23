<!--
id:expseg
category:Signal Generators:Linear and Exponential Generators
-->
# expseg
Trace a series of exponential segments between specified points.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = expseg(ia, idur1, ib [, idur2] [, ic] [...])
    kres = expseg(ia, idur1, ib [, idur2] [, ic] [...])
    ```

=== "Classic"
    ``` csound-orc
    ares expseg ia, idur1, ib [, idur2] [, ic] [...]
    kres expseg ia, idur1, ib [, idur2] [, ic] [...]
    ```

### Initialization

_ia_ -- starting value. Zero is illegal for exponentials.

_ib, ic_, etc. -- value after _dur1_ seconds, etc. For exponentials, must be non-zero and must agree in sign with _ia_.

_idur1_ -- duration in seconds of first segment. A zero or negative value will cause all initialization to be skipped.

_idur2, idur3_, etc. -- duration in seconds of subsequent segments. A zero or negative value will terminate the initialization process with the preceding point, permitting the last-defined line or curve to be continued indefinitely in performance. The default is zero.

### Performance

These units generate control or audio signals whose values can pass through 2 or more specified points. The sum of _dur_ values may or may not equal the instrument's performance time: a shorter performance will truncate the specified pattern, while a longer one will cause the last-defined segment to continue on in the same direction.

Note that the _expseg_ opcode does not operate correctly at audio rate when segments are shorter than a k-period. Try the [expsega](../opcodes/expsega.md) opcode instead.

## Examples

Here is an example of the expseg opcode. It uses the file [expseg.csd](../examples/expseg.csd).

``` csound-orc title="Example of the expseg opcode." linenums="1"
--8<-- "examples/expseg.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: Gabriel Maldonado

New in Csound 3.57
