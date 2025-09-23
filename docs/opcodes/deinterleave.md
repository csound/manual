<!--
id:deinterleave
category:Array Opcodes
-->
# deinterleave
Deinterleaves arrays by picking alternate data from its input.

## Syntax
=== "Modern"
    ``` csound-orc
    kout1[], kout2[] = deinterleave(kin[])
    ```

=== "Classic"
    ``` csound-orc
    kout1[], kout2[] deinterleave kin[]
    ```

### Performance

_kout1[], kout2[]_ -- output arrays containing the deinterleaved output. They will be created if not existent.

_kin[]_ -- input array containing the values to be deinterleaved.

## Examples

Here is an example of the deinterleave opcode. It uses the file [deinterleave.csd](../examples/deinterleave.csd).

``` csound-csd title="Example of the deinterleave opcode." linenums="1"
--8<-- "examples/deinterleave.csd"
```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2018<br>

New in version 6.12
