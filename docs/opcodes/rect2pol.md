<!--
id:rect2pol
category:Array Operations: complex numbers
-->
# rect2pol
Converts an input array in real-imaginary format to magnitude-phase format.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = rect2pol(kin[])
    ```

=== "Classic"
    ``` csound-orc
    kout[] rect2pol kin[]
    ```

### Performance

_kout[]_ -- output array containing the complex-valued magnitude-phase output. It will be created if it does not exist.

_kin[]_ -- input array containing the complex-valued real-imaginary input.

## Examples

Here is an example of the rect2pol opcode. It uses the file [rect2pol.csd](../examples/rect2pol.csd).

``` csound-csd title="Example of the rect2pol opcode." linenums="1"
--8<-- "examples/rect2pol.csd"
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
