<!--
id:dct
category:Array Operations: Discrete Cosine Transform
-->
# dct
Discrete Cosine Transform of a sample array (type-II DCT).

Applies a forward Discrete Cosine Transform to an input 1-dimensional array producing an array of the same size containing the transform. Currently only power-of-two sizes are implemented. Available in i-time or perf (k-rate) versions.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = dct(kin[])
    iout[] = dct(iin[])
    ```

=== "Classic"
    ``` csound-orc
    kout[] dct kin[]
    iout[] dct iin[]
    ```

### Initialization

_iout[]_ -- output array containing the DCT. It will be created if it does not exist.

_iin[]_ -- input array containing the input

### Performance

_kout[]_ -- output array containing the DCT. It will be created if it does not exist.

_kin[]_ -- input array containing the input

## Examples

Here is an example of the dct opcode. It uses the file [dct.csd](../examples/dct.csd).

``` csound-csd title="Example of the dct opcode." linenums="1"
--8<-- "examples/dct.csd"
```

## See Also

[Vectorial opcodes](../vectorial/top.md), [array opcodes](../math/array.md), [dctinv](../opcodes/dctinv.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2014<br>

New in version 6.04
