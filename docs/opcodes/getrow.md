<!--
id:getrow
category:Array Opcodes
-->
# getrow
Gets a given row from a 2-dimensional array as a vector.

The output is an 1-d array with the contents of the requested row.

## Syntax
=== "Modern"
    ``` csound-orc
    i/kout[] = getrow(i/kin[], i/krow)
    ```

=== "Classic"
    ``` csound-orc
    i/kout[] getrow i/kin[], i/krow
    ```

### Initialization

_iout[]_ -- output array containing the extracted row. It will be created if it does not exist.

_iin[]_ -- input 2-dimensional array.

_irow_ -- row to be extracted.

### Performance

_kout[]_ -- output array containing the extracted row. It will be created if it does not exist.

_kin[]_ -- input 2-dimensional array.

_krow_ -- row to be extracted.

## Examples

Here is an example of the getrow opcode. It uses the file [rfft.csd](../examples/rfft.csd).

``` csound-csd title="Example of the getrow opcode." linenums="1"
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
