<!--
id:rfft
category:Array Operations: Fast Fourier Transform
-->
# rfft
Fast Fourier Transform of a real-value array.

Applies a forward Fast Fourier Transform to a real-value input 1-dimensional array. The output is another array containing the transform, non-redundant, non-negative spectrum only. If the input array is power-of-two, the output array size will match the input size, with the first two points containing 0Hz and Nyquist frequency coefficients. Otherwise, the output will have two extra values (input size + 2), and the the Nyquist coefficient will be placed at kin[input_size] position (kin[1] and kin[input_size+1] will be 0).

## Syntax
``` csound-orc
kout[] rfft kin[]
```

### Performance

_kout[]_ -- output array containing the transform. It will be created if it does not exist.

_kin[]_ -- input array containing the real-valued input.

## Examples

Here is an example of the rfft opcode. It uses the file [rfft.csd](../examples/rfft.csd).

``` csound-csd title="Example of the rfft opcode." linenums="1"
--8<-- "examples/rfft.csd"
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
