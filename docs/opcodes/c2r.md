<!--
id:c2r
category:Array Operations: complex numbers
-->
# c2r
Real to complex format conversion.

Converts a complex-valued input array into a real-valued array, by removing its imaginary part. The output array will be half the size of the input. This is a utility operation to facilitate complex-valued operations where the result is purely real.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = c2r(kin[])
    ```

=== "Classic"
    ``` csound-orc
    kout[] c2r kin[]
    ```

### Performance

_kout[]_ -- output array containing the real-valued output. It will be created if it does not exist.

_kin[]_ -- input array containing the complex-valued real-imaginary input.

## Examples

=== "Modern"
    Here is an example of the c2r opcode. It uses the file [c2r-modern.csd](../examples/c2r-modern.csd).
    ``` csound-csd title="Example of the c2r opcode." linenums="1"
    --8<-- "examples/c2r-modern.csd"
    ```

=== "Classic"
    Here is an example of the c2r opcode. It uses the file [c2r.csd](../examples/c2r.csd).
    ``` csound-csd title="Example of the c2r opcode." linenums="1"
    --8<-- "examples/c2r.csd"
    ```

## See Also

[Vectorial opcodes](../vectorial/top.md)

[array opcodes](../math/array.md)

[Array-based spectral opcodes](../spectral/arrays.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2014<br>

New in version 6.04
