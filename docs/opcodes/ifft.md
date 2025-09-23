<!--
id:fftinv
category:Array Operations: Fast Fourier Transform
-->
# fftinv
Complex-to-complex Inverse Fast Fourier Transform.

Applies an Inverse Fast Fourier Transform to a complex-value input 1-dimensional array producing a complex-valued output. The output is another array containing the complex-valued signal, and both arrays are arranged in interleaved real-imaginary format. The output array will have the same size as the input, and the transform size will be equivalent to half of the length of the array. Non-power-of-two transforms are limited to even sizes with not too many factors.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = fftinv(kin[])
    ```

=== "Classic"
    ``` csound-orc
    kout[] fftinv kin[]
    ```

### Performance

_kout[]_ -- output array containing the complex-valued output. It will be created if it does not exist.

_kin[]_ -- input array containing the complex-valued input.

## Examples

Here is an example of the fftinv opcode. It uses the file [ifft.csd](../examples/ifft.csd).

``` csound-csd title="Example of the fftinv opcode." linenums="1"
--8<-- "examples/ifft.csd"
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
