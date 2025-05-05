<!--
id:unwrap
category:Array Operations: Fast Fourier Transform
-->
# unwrap
Applies a unwrapping operation to a vector of phase values stored in an array.

The output is an array with phases in the range of $[-\pi, \pi)$.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = unwrap(kin[])
    ```

=== "Classic"
    ``` csound-orc
    kout[] unwrap kin[]
    ```

### Performance

_kout[]_ -- output array containing the unwrapped phases. It will be created if it does not exist.

_kin[]_ -- input array containing the input vector.

## Examples

Here is an example of the unwrap opcode. It uses the file [unwrap.csd](../examples/unwrap.csd).

``` csound-csd title="Example of the unwrap opcode." linenums="1"
--8<-- "examples/unwrap.csd"
```

## See Also

[Vectorial opcodes](../vectorial/top.md), [array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2014<br>

New in version 6.04
