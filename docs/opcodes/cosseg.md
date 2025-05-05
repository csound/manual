<!--
id:cosseg
category:Signal Generators:Linear and Exponential Generators
-->
# cosseg
Trace a series of line segments between specified points with cosine interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = cosseg(ia, idur1, ib [, idur2] [, ic] [...])
    kres = cosseg(ia, idur1, ib [, idur2] [, ic] [...])
    ```

=== "Classic"
    ``` csound-orc
    ares cosseg ia, idur1, ib [, idur2] [, ic] [...]
    kres cosseg ia, idur1, ib [, idur2] [, ic] [...]
    ```

### Initialization

_ia_ -- starting value.

_ib, ic_, etc. -- value after _dur1_ seconds, etc.

_idur1_ -- duration in seconds of first segment. A zero or negative value will cause all initialization to be skipped.

_idur2, idur3_, etc. -- duration in seconds of subsequent segments. A zero or negative value will terminate the initialization process with the preceding point, permitting the last-defined line or curve to be continued indefinitely in performance. The default is zero.

### Performance

These units generate control or audio signals whose values can pass through 2 or more specified points. The sum of _dur_ values may or may not equal the instrument's performance time: a shorter performance will truncate the specified pattern, while a longer one will cause the last value to be repeated until the end of the note.

## Examples

Here is an example of the cosseg opcode. It uses the file [cosseg.csd](../examples/cosseg.csd).

``` csound-orc title="Example of the cosseg opcode." linenums="1"
--8<-- "examples/cosseg.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: John ffitch<br>
Aug 2012 <br>

New in version 5.18
