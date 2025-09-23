<!--
id:mags
category:Array Operations: complex numbers
-->
# mags
Obtains the magnitudes of a complex-number array.

This opcode returns the magnitudes of a complex-number array (in rfft format), as a real-valued array with half the size of its input plus one. The magnitude for the Nyquist frequency are kept in the last position of the array.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = mags(kin[])
    ```

=== "Classic"
    ``` csound-orc
    kout[] mags kin[]
    ```

### Performance

_kout[]_ -- output array containing the magnitudes (size = input_size/2 + 1). It will be created if it does not exist.

_kin[]_ -- input array containing the complex-valued real-imaginary input.

## Examples

Here is an example of the mags opcode. It uses the file [mags.csd](../examples/mags.csd).

``` csound-csd title="Example of the mags opcode." linenums="1"
--8<-- "examples/mags.csd"
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
