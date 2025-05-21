<!--
id:fft
category:Array Operations: Fast Fourier Transform
-->
# fft
Complex-to-complex Fast Fourier Transform.

Applies a forward Fast Fourier Transform to a complex-valued input
1-dimensional array producing a complex-valued output. The output is
another array containing the complex-valued signal, and both arrays
are arranged in interleaved real-imaginary format. 

In the case of the k-array version, 
the output array will have the same size as the input, 
and the transform size will be
equivalent to half of the length of the input 
array (since the real and imag parts are interleaved). The
transform is always forward in this version.

This is not the case in the Complex-type array versions,
where the transform size always matches the size of the input.
There are three of these: complex to complex
types (forward or inverse); real to complex (forward) and
complex to real (inverse). The last two are not true real-fft
transforms: they still produce/consume a full Hermitian-symmetric
spectrum, but they only use real time-domain signals (and assume
imaginary part is always zero).

Non-power-of-two transforms are limited to even sizes 
with not too many factors.

## Syntax
=== "Modern"
    ``` csound-orc
    out:k[] = fft(in:k[])
    in:Complex[] = fft(in:Complex[][,inverse:i])
    in:Complex[] = fft(in:k[]);
    out:k[] = fft(in:Complex[]);
    ```

=== "Classic"
    ``` csound-orc
    kout[] fft kin[]
    in:Complex[] fft in:Complex[]
    in:Complex[] fft in:k[] 
    kout[] fft in:Complex[];
    ```

### Initialisation

_inverse_ -- if non-zero, apply an inverse transform. Defaults to 0 (forward).

### Performance

_out_ -- output array containing the complex or real-valued output,
depending on the opcode version. It will be created if it does not exist.

_in_ -- input array containing the complex or real-valued input,
depending on the opcode version.

## Examples

Here is an example of the fft opcode. It uses the file [fft.csd](../examples/fft.csd).

``` csound-csd title="Example of the fft opcode." linenums="1"
--8<-- "examples/fft.csd"
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
