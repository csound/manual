<!--
id:r2c
category:Array Operations: complex numbers
-->
# r2c
Real to complex format conversion.

Converts a real-valued input array in real-imaginary interleaved complex format, setting its imaginary parts to 0. The output array will be double the size of the input. This is a utility operation to facilitate complex-value operations on real arrays.

## Syntax
``` csound-orc
kout[] r2c kin[]
```

### Performance

_kout[]_ -- output array containing the complex-valued real-imaginary output. It will be created if it does not exist.

_kin[]_ -- input array containing the real-valued input.

## Examples

Here is an example of the r2c opcode. It uses the file [r2c.csd](../../examplesr2c.csd).

``` csound-csd title="Example of the r2c opcode." linenums="1"
--8<-- "examples/r2c.csd"
```

## See Also

[Vectorial opcodes](../../vectorial/top)

[array opcodes](../../math/array)

[Array-based spectral opcodes](../../spectral/arrays)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2014<br>

New in version 6.04
