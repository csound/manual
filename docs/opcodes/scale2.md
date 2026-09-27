<!--
id:scale2
category:Signal Generators:Linear and Exponential Generators
-->
# scale2
Arbitrary signal scaling with optional smoothing.

Maps an input range to an output range, with optional smoothing.

## Syntax
=== "Modern"
    ``` csound-orc
    kscl = scale2(kinput, kmin, kmax [, kimin, kimax, ihtime])
    ```

=== "Classic"
    ``` csound-orc
    kscl scale2 kinput, kmin, kmax [, kimin, kimax, ihtime]
    ```

### Initialization

_ihtime_ -- smoothing half-time in seconds. For a constant mapped value, this is the time needed to halve the remaining difference between the output and that value. Zero disables smoothing (the default). Negative values are not allowed.

### Performance

_kinput_ -- input value. Values below _kimin_ or above _kimax_ are clamped to those bounds before scaling.

_kmin_ -- output value corresponding to _kimin_.

_kmax_ -- output value corresponding to _kimax_. The output range may run in either direction.

_kimin_ -- Optional; Minimum of the incoming value range, defaulting to zero.

_kimax_ -- Optional; Maximum of the incoming value range, defaulting to one. It must be greater than _kimin_.

Smoothing starts from zero each time the opcode initializes. The output can therefore start outside the output range while it moves toward the mapped value. With smoothing disabled, the output is the mapped value immediately.

> :warning: **Warning**
> 
> The argument order is minimum before maximum, which differs from _scale_.

## Examples

Here is an example of the scale2 opcode. It uses the file [scale2.csd](../examples/scale2.csd).

``` csound-orc title="Example of the scale2 opcode." linenums="1"
--8<-- "examples/scale2.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: John ffitch after David Akbari<br>
December<br>
2020<br>
