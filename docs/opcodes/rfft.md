<!--
id:rfft
category:Array Operations: Fast Fourier Transform
-->
# rfft
Fast Fourier Transform of a real-value array.

Applies a forward Fast Fourier Transform to a real-value input
1-dimensional array. The output is another array containing the
transform, non-redundant, non-negative spectrum only. 

In the case of the k-array version, the output array size will match
 the input size, with the first two points containing 0Hz and Nyquist
 frequency coefficients. This is the _packed_ output format.
 
The Complex-array version, on the other hand, produces an array
size that is one unit longer than the input (input size + 1 complex
numbers), containing the Nyquist frequency coefficient in
the last position of the Complex array.

Non-power-of-two transforms are limited to even sizes 
with not too many factors.

## Syntax
=== "Modern"
    ``` csound-orc
    out:k[] = rfft(in:k[])
    out:Complex[] = rfft(in:k[])    
    ```

=== "Classic"
    ``` csound-orc
    kout[] rfft kin[]
    out:Complex[] rfft in:k[]    
    ```

### Performance

_kout[]_ -- output array containing the transform. It will be created if it does not exist.

_kin[]_ -- input array containing the real-valued input.

## Examples

Here is an example of the rfft opcode. It uses the file [rfft.csd](../examples/rfft.csd).

``` csound-csd title="Example of the rfft opcode." linenums="1"
--8<-- "examples/rfft.csd"
```

Another example of the rfft opcode, now using a Complex-type array. It uses the file [rfft_complex_type.csd](../examples/rfft_complex_type.csd).

``` csound-csd title="Example of the rfft opcode (Complex array." linenums="1"
--8<-- "examples/rfft_complex_type.csd"
```


## See Also

[Vectorial opcodes](../vectorial/top.md)

[Array opcodes](../math/array.md)

[Array-based spectral opcodes](../spectral/arrays.md)

## Credits

Author: Victor Lazzarini  
NUI Maynooth  
2014, 2025  

New in version 6.04  
Complex type introduced in version 7.
