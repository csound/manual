<!--
id:fmod
category:Mathematical Operations:Arrays
-->
# fmod
Computes the remainder of the division of its first argument by the second.

## Syntax
=== "Modern"
    ``` csound-orc
    ires[] = fmod(iarg1[], iarg2[])
    kres[] = fmod(karg1[], karg2[])
    ires[] = fmod(iarg1[], iarg2)
    kres[] = fmod(karg[], karg2)
    ```

=== "Classic"
    ``` csound-orc
    ires[] fmod iarg1[], iarg2[]
    kres[] fmod karg1[], karg2[]
    ires[] fmod iarg1[], iarg2
    kres[] fmod karg[], karg2
    ```

### Initialization

_iarg[]1/2, iarg2_ -- the operands.

### Performance

_karg[]1/2, karg2_ -- the operands

## Examples

Here is an example of the fmod opcode. It uses the file [fmod.csd](../examples/fmod.csd).

``` csound-csd title="Example of the fmod opcode." linenums="1"
--8<-- "examples/fmod.csd"
```

## See Also

[Array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
2017<br>
