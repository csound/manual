<!--
id:expon
category:Signal Generators:Linear and Exponential Generators
-->
# expon
Trace an exponential curve between specified points.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = expon(ia, idur, ib)
    kres = expon(ia, idur, ib)
    ```

=== "Classic"
    ``` csound-orc
    ares expon ia, idur, ib
    kres expon ia, idur, ib
    ```

### Initialization

_ia_ -- starting value. Zero is illegal for exponentials.

_ib_ -- value after _idur_ seconds. For exponentials, must be non-zero and must agree in sign with _ia_.

_idur_ -- duration in seconds of the segment. A zero or negative value will cause all initialization to be skipped.

### Performance

These units generate control or audio signals whose values can pass through 2 specified points. The _idur_ value may or may not equal the instrument's performance time: a shorter performance will truncate the specified pattern, while a longer one will cause the defined segment to continue on in the same direction.

## Examples

Here is an example of the expon opcode. It uses the file [expon.csd](../examples/expon.csd).

``` csound-orc title="Example of the expon opcode." linenums="1"
--8<-- "examples/expon.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)
