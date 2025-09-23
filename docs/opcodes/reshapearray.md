<!--
id:reshapearray
category:Array Opcodes
-->
# reshapearray
Reshape an array, maintaining its capacity.

Plugin opcode in emugens.

The _reshapearray_ opcode changes the shape of an array, as long as this does not modify its capacity. It can be used to convert a 1D to a 2D array, or viceversa, or simply to modify the size of its dimensions, as long as the product remains constant.

## Syntax
=== "Modern"
    ``` csound-orc
    reshapearray(array[], isize0 [, isize1 ])
    ```

=== "Classic"
    ``` csound-orc
    reshapearray array[], isize0 [, isize1 ]
    ```

### Initialization

_array[]_ - The array to be reshaped (this is done inplace)

_isize0_ - The size of the first dimension

_isize1_ - The size of the second dimension (0 for 1D arrays). _Defaults to 0_

## Examples

Here is an example of the reshapearray opcode. It uses the file [reshapearray.csd](../examples/reshapearray.csd).

``` csound-csd title="Example of the reshapearray opcode." linenums="1"
--8<-- "examples/reshapearray.csd"
```

## See also

[Array opcodes](../math/array.md)

## Credits

By: Eduardo Moguillansky 2018

New plugin in version 6.12
