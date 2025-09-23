<!--
id:scale2
category:Signal Generators:Linear and Exponential Generators
-->
# scale2
Arbitrary signal scaling with optional smoothing.

Scales incoming value to user-definable range. Similar to scale object found in popular dataflow languages.

## Syntax
=== "Modern"
    ``` csound-orc
    kscl = scale2(kinput, kmin, kmax[, kimin, kimax][ihtime])
    ```

=== "Classic"
    ``` csound-orc
    kscl scale2 kinput, kmin, kmax[, kimin, kimax][ihtime]
    ```

Initialisation

_ihtime_ -- Optional; Half time value for internal port filter for smoothing.  Default is no smoothing.

### Performance

_kin_ -- Input value. Can originate from any k-rate source and should be in the range _kimin_ to _kimax_.  If it is larger than kimax it is treated as kimax, and if less than kimin then it is treated as kimin.

_kmin_ -- Minimum value of the resultant scale operation.

_kmax_ -- Maximum value of the resultant scale operation.

_kimin_ -- Optional; Minimum of the incoming value range, defaulting to zero.

_kimax_ -- Optional; Maximum of the incoming value range, defaulting to one.

> :warning: **Warning**
> 
> The argument order is minimum before maximum, which differs from _scale_ but it consistent with other opcodes that use a range.

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
