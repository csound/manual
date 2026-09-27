<!--
id:scalearray
category:Array Opcodes
-->
# scalearray
The _scalearray_ opcode scales a subregion of a vector to a given minimum/maximum.

## Syntax
=== "Modern"
    ``` csound-orc
    scalearray(karray, kmin, kmax[, kleft, kright])
    ```

=== "Classic"
    ``` csound-orc
    scalearray karray, kmin, kmax[, kleft, kright]
    ```

### Performance

_karray_ --  array for operation.

_kmin, kmax_ --  target minimum and maximum values.

_kleft, kright_ --  range of table to use, defaulting to 0 and size of the vector.

## Replacing scalet

[scalet](scalet.md) is the deprecated k-rate name. Replace `scalet(kArray, kmin, kmax, kleft, kright)` with `scalearray(kArray, kmin, kmax, kleft, kright)`. Both modify the same array in place on each control cycle.

The left index is inclusive and the right index is exclusive. Defaults select the whole vector. `scalearray` also supports an i-rate array form for initialization-time scaling.

## Examples

Here is an example of the scalearray opcode. It uses the file [scalearray.csd](../examples/scalearray.csd).

``` csound-csd title="Example of the scalearray opcode." linenums="1"
--8<-- "examples/scalearray.csd"
```

## See Also

[Array opcodes](../math/array.md)

## Credits

Author: John ffitch<br>
October 2011<br>

New in Csound version 5.14

Renamed in Csound version 6.00
