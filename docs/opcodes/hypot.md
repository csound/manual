<!--
id:hypot
category:Mathematical Operations:Arrays
-->
# hypot
Euclidean distance function.

## Syntax
=== "Modern"
    ``` csound-orc
    ires[] = hypot(iarg1[], iarg2[])
    kres[] = hypot(karg1[], karg2[])
    ```

=== "Classic"
    ``` csound-orc
    ires[] hypot iarg1[], iarg2[]
    kres[] hypot karg1[], karg2[]
    ```

### Initialization

_iarg[]1/2_ -- the operands.

### Performance

_karg[]1/2_ -- the operands

## Examples

Here is an example of the hypot opcode. It uses the file [hypot.csd](../examples/hypot.csd).

``` csound-csd title="Example of the hypot opcode." linenums="1"
--8<-- "examples/hypot.csd"
```

## See Also

[Array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
2017 <br>
