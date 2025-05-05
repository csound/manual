<!--
id:cmplxprod
category:Array Operations: complex numbers
-->
# cmplxprod
Complex  product of two arrays of the same size and in real-imaginary interleaved format.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = cmplxprod(kin1[], kin2[])
    ```

=== "Classic"
    ``` csound-orc
    kout[] cmplxprod kin1[], kin2[]
    ```

### Performance

_kout[]_ -- output array containing the product. It will be created if it does not exist.

_kin1[], kin2[]_ -- input arrays containing the complex inputs.

## Examples

Here is an example of the cmplxprod opcode. It uses the file [cmplxprod.csd](../examples/cmplxprod.csd).

``` csound-csd title="Example of the cmplxprod opcode." linenums="1"
--8<-- "examples/cmplxprod.csd"
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
