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

_idur_ -- duration in seconds of the segment. A zero or negative value skips initialization, preserving the current value and rate during reinitialization.

### Performance

The first output is _ia_. The magnitude changes by a constant factor at each audio sample or control cycle. For example, a curve from 1 to 4 passes through 2 halfway through _idur_. Both endpoints can also be negative; the curve stays on the same side of zero.

If the note lasts longer than _idur_, the curve continues past _ib_ at the same exponential rate. If the note ends sooner, the curve stops at that point.

## Examples

Here is an example of the expon opcode. It uses the file [expon.csd](../examples/expon.csd).

``` csound-orc title="Example of the expon opcode." linenums="1"
--8<-- "examples/expon.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)
