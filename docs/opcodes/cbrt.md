<!--
id:cbrt
category:Mathematical Operations:Arrays
-->
# cbrt
Cubic root function.

## Syntax
=== "Modern"
    ``` csound-orc
    ires[] = cbrt(iarg)
    kres[] = cbrt(karg)
    ```

=== "Classic"
    ``` csound-orc
    ires[] cbrt iarg
    kres[] cbrt karg
    ```

### Initialization

_iarg[]_ -- the argument.

### Performance

_karg[]_ -- the argument.

## Examples

=== "Modern"
    Here is an example of the cbrt opcode. It uses the file [cbrt-modern.csd](../examples/cbrt-modern.csd).
    ``` csound-csd title="Example of the cbrt opcode." linenums="1"
    --8<-- "examples/cbrt-modern.csd"
    ```

=== "Classic"
    Here is an example of the cbrt opcode. It uses the file [cbrt.csd](../examples/cbrt.csd).
    ``` csound-csd title="Example of the cbrt opcode." linenums="1"
    --8<-- "examples/cbrt.csd"
    ```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
2017<br>
