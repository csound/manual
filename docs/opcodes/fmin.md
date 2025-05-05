<!--
id:fmin
category:Mathematical Operations:Arrays
-->
# fmin
Returns the minimum of its two arguments.

## Syntax
=== "Modern"
    ``` csound-orc
    ires[] = fmin(iarg1[], iarg2[])
    kres[] = fmin(karg1[], karg2[])
    ires[] = fmin(iarg1[], iarg2)
    kres[] = fmin(karg[], karg2)
    ```

=== "Classic"
    ``` csound-orc
    ires[] fmin iarg1[], iarg2[]
    kres[] fmin karg1[], karg2[]
    ires[] fmin iarg1[], iarg2
    kres[] fmin karg[], karg2
    ```

### Initialization

_iarg[]1/2, iarg2_ -- the operands.

### Performance

_karg[]1/2, karg2_ -- the operands

## Examples

Here is an example of the fmin opcode. It uses the file [fmin.csd](../examples/fmin.csd).

``` csound-csd title="Example of the fmin opcode." linenums="1"
--8<-- "examples/fmin.csd"
```

## See Also

[Array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
2017 <br>
