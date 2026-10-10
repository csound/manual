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

_idur_ -- segment duration in seconds. A zero or negative value skips initialization. On reinitialization, this preserves the current value and slope.

### Performance

_line_ starts at _ia_ and moves toward _ib_ over _idur_ seconds. The audio form updates once per sample; the control form updates once per control period. If _idur_ falls between updates, the output steps past _ib_ on the next update.

> :memo: **Note**
>
> After _idur_, the output continues at the same slope. It does not hold at _ib_. Use [linseg](linseg.md) for a ramp that holds its final value.


## Examples

Here is an example of the line opcode. It uses the file [line.csd](../examples/line.csd).

``` csound-csd title="Example of the line opcode." linenums="1"
--8<-- "examples/line.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)
