<!--
id:getcol
category:Array Opcodes
-->
# getcol
Gets a given column from a 2-dimensional array as a vector.

The output is an 1-d array with the contents of the requested column

## Syntax
=== "Modern"
    ``` csound-orc
    i/kout[] = getcol(i/kin[], i/kcol)
    ```

=== "Classic"
    ``` csound-orc
    i/kout[] getcol i/kin[], i/kcol
    ```

### Initialization

_iout[]_ -- output array containing the extracted column. It will be created if it does not exist.

_iin[]_ -- input 2-dimensional array.

_icol_ -- column to be extracted.

### Performance

_kout[]_ -- output array containing the extracted column. It will be created if it does not exist.

_kin[]_ -- input 2-dimensional array.

_kcol_ -- column to be extracted.

## Examples

Here is an example of the getcol opcode. It uses the file [getcol.csd](../examples/getcol.csd).

``` csound-csd title="Example of the getcol opcode." linenums="1"
--8<-- "examples/getcol.csd"
```

## See Also

[Vectorial Opcodes](../vectorial/top.md)

[Array Opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2014<br>

New in version 6.04
