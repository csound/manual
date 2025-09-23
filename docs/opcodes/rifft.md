<!--
id:rifft
category:Array Operations: Fast Fourier Transform
-->
# rifft
Complex-to-real Inverse Fast Fourier Transform.

Applies an Inverse Fast Fourier Transform to a complex-value input
1-dimensional array producing a real-valued output. The output is
another array containing the real-valued signal. The
k-rate input expects a _packed_ input (see
[rfft](../opcodes/rfft.md)).

The Complex-array version, on the other hand, expects an array
size that is one unit longer than the output (output size + 1 complex
numbers), containing the Nyquist frequency coefficient in
the last position of the Complex array.

Non-power-of-two transforms are limited to even sizes 
with not too many factors.


## Syntax
=== "Modern"
    ``` csound-orc
    out:k[] = rifft(in:k[])
    out:k[] = rifft(in:Complex[])    
    ```

=== "Classic"
    ``` csound-orc
    kout[] rifft kin[]
    kout[] rifft in:Complex[]    
    ```

### Performance

_out_ -- output array containing the real-valued output. It will be created if it does not exist.

_in_ -- input array containing the complex input.

## Examples

Here is an example of the rifft opcode. It uses the file [irfft.csd](../examples/irfft.csd).

``` csound-csd title="Example of the rifft opcode." linenums="1"
--8<-- "examples/irfft.csd"
```

Another example of the rifft opcode, now using a Complex-type array. It uses the file [rfft_complex_type.csd](../examples/rfft_complex_type.csd).

``` csound-csd title="Example of the rfft opcode (Complex array." linenums="1"
--8<-- "examples/rfft_complex_type.csd"
```


## See Also

[Vectorial opcodes](../vectorial/top.md)

[array opcodes](../math/array.md)

[Array-based spectral opcodes](../spectral/arrays.md)

## Credits

Author: Victor Lazzarini  
NUI Maynooth  
2014, 2025  

New in version 6.04  
Complex type introduced in version 7.
