<!--
id:interleave
category:Array Opcodes
-->
# interleave
Interleaves arrays into a a single one by placing the input data in alternate positions.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = interleave(kin1[], kin2[])
    ```

=== "Classic"
    ``` csound-orc
    kout[] interleave kin1[], kin2[]
    ```

### Performance

_kout[]_ -- output array containing the interleaved output. It will be created if it does not exist.

_kin1[], kin2[]_ -- input arrays containing the values to be interleaved.

## Examples

Here is an example of the interleave opcode. It uses the file [interleave.csd](../examples/interleave.csd).

``` csound-csd title="Example of the interleave opcode." linenums="1"
--8<-- "examples/interleave.csd"
```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2018<br>

New in version 6.12
