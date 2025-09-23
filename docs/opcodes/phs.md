<!--
id:phs
category:Array Operations: complex numbers
-->
# phs
Obtains the phases of a complex-number array.

This opcode returns the phases of a complex-number array, as a real-valued array with half the size of its input plus one. The reason for the extra point is to keep the array size equivalent to the output of the mags opcode (which is often used alongside this one).

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = phs(kin[])
    ```

=== "Classic"
    ``` csound-orc
    kout[] phs kin[]
    ```

### Performance

_kout[]_ -- output array containing the phases. It will be created if it does not exist.

_kin[]_ -- input array containing the complex-valued real-imaginary input.

## Examples

Here is an example of the phs opcode. It uses the file [phs.csd](../examples/phs.csd).

``` csound-csd title="Example of the phs opcode." linenums="1"
--8<-- "examples/phs.csd"
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
