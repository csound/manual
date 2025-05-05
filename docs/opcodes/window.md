<!--
id:window
category:Array Operations: Fast Fourier Transform
-->
# window
Applies a given window shape to a vector stored in an array. The output is an array with the windowed vector.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = window(kin[] [, koff, itype])
    ```

=== "Classic"
    ``` csound-orc
    kout[] window kin[] [, koff, itype]
    ```

### Initialization

_itype_ -- optional window type: 0 = Hamming, 1 = Hanning (von Hann) (defaults to 1).

### Performance

_kout[]_ -- output array containing the windowed output. It will be created if it does not exist.

_kin[]_ -- input array containing the input vector.

_koff_ -- offset to make window start at position koff (non-negative only, defaults to 0).

## Examples

Here is an example of the window opcode. It uses the file [window.csd](../examples/window.csd).

``` csound-csd title="Example of the window opcode." linenums="1"
--8<-- "examples/window.csd"
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
