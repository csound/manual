<!--
id:dot
category:Array Operations: dot product
-->
# dot
Calculates the dot product of two arrays.

## Syntax
=== "Modern"
    ``` csound-orc
    kres/ires = dot(karr1[]/iarr1[], karr2[]/iarr2[])   (k- or i-arrays)
    ```

=== "Classic"
    ``` csound-orc
    kres/ires dot karr1[]/iarr1[], karr2[]/iarr2[]   (k- or i-arrays)
    ```

## Examples

Here is an example of the dot opcode. It uses the file [dota.csd](../examples/dot.csd).

``` csound-csd title="Example of the dot opcode." linenums="1"
--8<-- "examples/dot.csd"
```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini

New in version 6.09
