<!--
id:line
category:Signal Generators:Linear and Exponential Generators
-->
# line
Trace a straight line between specified points.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = line(ia, idur, ib)
    kres = line(ia, idur, ib)
    ```

=== "Classic"
    ``` csound-orc
    ares line ia, idur, ib
    kres line ia, idur, ib
    ```

### Initialization

_ia_ -- starting value.

_ib_ -- value after _idur_ seconds.

_idur_ -- duration in seconds of segment. A zero or negative value will cause all initialization to be skipped.

### Performance

_line_ generates control or audio signals whose values move linearly from an initial value to a final one.

> :memo: **Note**
>
> A common error with this opcode is to assume that the value of _ib_ is held after the time _idur1_. _line_ does not automatically end or stop at the end of the duration given. If your note length is longer than _idur_ seconds, _kres_ (or _ares_) will not come to rest at _ib_, but will instead continue to rise or fall with the same rate. If a rise (or fall) and then hold is required that the _linseg_ opcode should be considered instead.


## Examples

Here is an example of the line opcode. It uses the file [line.csd](../examples/line.csd).

``` csound-orc title="Example of the line opcode." linenums="1"
--8<-- "examples/line.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)
