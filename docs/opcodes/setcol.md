<!--
id:setcol
category:Array Opcodes
-->
# setcol
Sets a given column of a 2-dimensional array from a vector.

The output is an 2-d array with the contents of the requested column set to values of the input array (1-d; if 2-d the first row of the input array is used).

## Syntax
=== "Modern"
    ``` csound-orc
    i/kout[] = setcol(i/kin[], i/kcol)
    ```

=== "Classic"
    ``` csound-orc
    i/kout[] setcol i/kin[], i/kcol
    ```

### Initialization

_iout[]_ -- output array containing the extracted column. It will be created if it does not exist.

_iin[]_ -- input array.

_icol_ -- column to be extracted.

### Performance

_kout[]_ -- output array containing the set column. It will be created if it does not exist.

_kin[]_ -- input array.

_kcol_ -- column to be set.

## Examples

Here is an example of the setcol opcode. It uses the file [setcol.csd](../examples/setcol.csd).

``` csound-csd title="Example of the setcol opcode." linenums="1"
--8<-- "examples/setcol.csd"
```

## See Also

[Vectorial Opcodes](../vectorial/top.md)

[Array Opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2014<br>

New in version 6.04
