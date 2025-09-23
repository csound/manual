<!--
id:setrow
category:Array Opcodes
-->
# setrow
Sets a given row of a 2-dimensional array from a vector.

The output is an 2-d array with the contents of the requested row set to values of the input array (1-d; if 2-d the first row of the input array is used).

## Syntax
=== "Modern"
    ``` csound-orc
    i/kout[] = setrow(i/kin[], i/krow)
    ```

=== "Classic"
    ``` csound-orc
    i/kout[] setrow i/kin[], i/krow
    ```

### Initialization

_iout[]_ -- output array containing the set row. It will be created if it does not exist.

_iin[]_ -- input array.

_irow_ -- row to be set.

### Performance

_kout[]_ -- output array containing the set row. It will be created if it does not exist.

_kin[]_ -- input array.

_krow_ -- row to be set.

## Examples

Here is an example of the setrow opcode. It uses the file [rfft.csd](../examples/rfft.csd).

``` csound-csd title="Example of the setrow opcode." linenums="1"
--8<-- "examples/rfft.csd"
```

## See Also

[Vectorial Opcodes](../vectorial/top.md)

[Array Opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2014<br>

New in version 6.04
