<!--
id:scale
category:Signal Generators:Linear and Exponential Generators
-->
# scale
Arbitrary signal scaling.

Scales incoming value to user-definable range. Similar to scale object found in popular dataflow languages.

## Syntax
=== "Modern"
    ``` csound-orc
    kscl = scale(kinput, kmax, kmin[, kimax, kimin])
    ```

=== "Classic"
    ``` csound-orc
    kscl scale kinput, kmax, kmin[, kimax, kimin]
    ```

### Performance

_kin_ -- Input value. Can originate from any
k-rate source as long as that source's output is in range
_kimin_ to _kimax_.

_kmin_ -- Minimum value of the resultant scale operation.

_kmax_ -- Maximum value of the resultant scale operation.

_kimin_ -- Optional; Minimum of the incoming
value range, defaulting to zero.

_kimax_ -- Optional; Maximum of the incoming
value range, defaulting to one.

> :warning: **Warning**
>
> Take care with the order of the arguments which has maximum before minimum

## Examples

Here is an example of the scale opcode. It uses the file [scale.csd](../examples/scale.csd).

``` csound-orc title="Example of the scale opcode." linenums="1"
--8<-- "examples/scale.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: David Akbari<br>
October<br>
2006<br>
John ffitch<br>
Modified to add input range values in 2020<br>
