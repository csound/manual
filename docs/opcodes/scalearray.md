<!--
id:scalearray
category:Array Opcodes
-->
# scalearray
The _scalearray_ opcode scales a subregion of a vector to a given minimum/maximum.

## Syntax
=== "Modern"
    ``` csound-orc
    scalearray(tarray, kmin, kmax[, kleft, kright])
    ```

=== "Classic"
    ``` csound-orc
    scalearray tarray, kmin, kmax[, kleft, kright]
    ```

### Performance

_karray_ --  array for operation.

_kmin, kmax_ --  target minimum and maximum values.

_kleft, kright_ --  range of table to use, defaulting to 0 and size of the vector.

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
