<!--
id:limit1
category:Mathematical Operations:Arrays
-->
# limit1
Limits the value of an argument to the range [0,1].

## Syntax
=== "Modern"
    ``` csound-orc
    ires[] = limit1(iarg)
    kres[] = limit1(karg)
    ```

=== "Classic"
    ``` csound-orc
    ires[] limit1 iarg
    kres[] limit1 karg
    ```

### Initialization

_iarg[]_ -- the argument.

### Performance

_karg[]_ -- the argument.

## Examples

Here is an example of the limit1 opcode. It uses the file [limit1.csd](../examples/limit1.csd).

``` csound-csd title="Example of the limit1 opcode." linenums="1"
--8<-- "examples/limit1.csd"
```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
2017 <br>
