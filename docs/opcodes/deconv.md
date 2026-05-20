<!--
id:deconv
category:Array Operations: Fast Fourier Transform
-->
# deconv

Inverse convolution of one array by another using the fast Fourier
transform. The operation is Y(k) = X(k)/S(k), where X(k) is the
spectrum of the signal x(n) to which the inverse convolution is applied,
and S(k) is the spectrum of the inverse convolution operand s(n).

## Syntax
=== "Modern"
    ``` csound-orc
    out:i[] = deconv(in1:i[],in2:i[])
    out:k[] = deconv(in1:k[],in2:k[])    
    ```

=== "Classic"
    ``` csound-orc
    iout[] deconv iin1[], iin2[]
    kout[] deconv kin1[], kin2[]    
    ```

### Initialization

_iout[]_ -- output array containing the inverse convolution
(y(n)). The length of the output array is the same as that of input2.

_iin1[]_ -- input to the inverse convolution (x(n)).

_iin2[]_ -- inverse convolution operand (s(n)), determines the length
of the output array.

### Performance

_kout[]_ -- output array containing the inverse convolution
(y(n)). The length of the output array is the same as that of input2.

_ikn1[]_ -- input to the inverse convolution (x(n)).

_kin2[]_ -- inverse convolution operand (s(n)), determines the length
of the output array.


## Examples

Here is an example of the rfft opcode. It uses the file [ideconv.csd](../examples/ideconv.csd).

``` csound-csd title="Example of the rfft opcode." linenums="1"
--8<-- "examples/rfft.csd"
```


## See Also

[Vectorial opcodes](../vectorial/top.md)

[Array opcodes](../math/array.md)

[Array-based spectral opcodes](../spectral/arrays.md)

## Credits

Author: Victor Lazzarini  
NUI Maynooth  
2026  

