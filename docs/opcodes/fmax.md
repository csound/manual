<!--
id:fmax
category:Mathematical Operations:Arrays
-->
# fmax
Returns the maximum of its two arguments.

## Syntax
=== "Modern"
    ``` csound-orc
    ires[] = fmax(iarg1[], iarg2[])
    kres[] = fmax(karg1[], karg2[])
    ires[] = fmax(iarg1[], iarg2)
    kres[] = fmax(karg[], karg2)
    ```

=== "Classic"
    ``` csound-orc
    ires[] fmax iarg1[], iarg2[]
    kres[] fmax karg1[], karg2[]
    ires[] fmax iarg1[], iarg2
    kres[] fmax karg[], karg2
    ```

### Initialization

_iarg[]1/2, iarg2_ -- the operands.

### Performance

_karg[]1/2, karg2_ -- the operands

## Examples

Here is an example of the fmax opcode. It uses the file [fmax.csd](../examples/fmax.csd).

``` csound-csd title="Example of the fmax opcode." linenums="1"
--8<-- "examples/fmax.csd"
```

## See Also

[Array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
2017<br>
