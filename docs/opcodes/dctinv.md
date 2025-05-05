<!--
id:dctinv
category:Array Operations: Discrete Cosine Transform
-->
# dctinv
Inverse Discrete Cosine Transform of a sample array (type-III DCT).

Applies an Inverse Discrete Cosine Transform to an input 1-dimensional array producing an array of the same size containing the transform. Currently only power-of-two sizes are implemented. Available in i-time or perf (k-rate) versions.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = dctinv(kin[])
    iout[] = dctinv(iin[])
    ```

=== "Classic"
    ``` csound-orc
    kout[] dctinv kin[]
    iout[] dctinv iin[]
    ```

### Initialization

_iout[]_ -- output array containing the IDCT. It will be created if it does not exist.

_iin[]_ -- input array containing the input

### Performance

_kout[]_ -- output array containing the IDCT. It will be created if it does not exist.

_kin[]_ -- input array containing the input

## Examples

Here is an example of the dctinv opcode. It uses the file [dctinv.csd](../examples/dctinv.csd).

``` csound-csd title="Example of the dctinv opcode." linenums="1"
--8<-- "examples/dctinv.csd"
```

## See Also

[Vectorial opcodes](../vectorial/top.md), [array opcodes](../math/array.md), [dct](../opcodes/dct.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2014<br>

New in version 6.04
