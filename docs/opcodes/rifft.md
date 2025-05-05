<!--
id:rifft
category:Array Operations: Fast Fourier Transform
-->
# rifft
Complex-to-real Inverse Fast Fourier Transform.

Applies an Inverse Fast Fourier Transform to a complex-value input 1-dimensional array producing a real-valued output. The output is another array containing the real-valued signal. If the input array is power-of-two, the output array size will match the input size. Otherwise, the output will have two fewer values (input size - 2).

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = rifft(kin[])
    ```

=== "Classic"
    ``` csound-orc
    kout[] rifft kin[]
    ```

### Performance

_kout[]_ -- output array containing the real-valued output. It will be created if it does not exist.

_kin[]_ -- input array containing the complex input.

## Examples

Here is an example of the rifft opcode. It uses the file [irfft.csd](../examples/irfft.csd).

``` csound-csd title="Example of the rifft opcode." linenums="1"
--8<-- "examples/irfft.csd"
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
