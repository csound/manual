<!--
id:logcurve
category:Signal Generators:Linear and Exponential Generators
-->
# logcurve
This opcode implements a formula for generating a normalised logarithmic curve in range 0 - 1. It is based on the Max / MSP work of Eric Singer (c) 1994.

Generates a logarithmic curve in range 0 to 1 of arbitrary steepness. Steepness index less than 1.0 would result in Not-a-Number errors and cause unstable behavior, so it is treated as if it were 1.

The formula used to calculate the curve is:

```
log(x * (y-1)+1) / log(y)
```

where x is equal to _kindex_ and y is equal to _ksteepness_.

## Syntax
=== "Modern"
    ``` csound-orc
    kout = logcurve(kindex, ksteepness)
    ```

=== "Classic"
    ``` csound-orc
    kout logcurve kindex, ksteepness
    ```

### Performance

_kindex_ -- Index value. Expected range 0 to 1.

_ksteepness_ -- Steepness of the generated curve. Values closer to 1.0 result in a straighter line while larger values steepen the curve.

_kout_ -- Scaled output.

## Examples

Here is an example of the logcurve opcode. It uses the file [logcurve.csd](../examples/logcurve.csd).

``` csound-orc title="Example of the logcurve opcode." linenums="1"
--8<-- "examples/logcurve.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: David Akbari<br>
October<br>
2006<br>
Range check introduced in 6.16 by John ffitch<br>
