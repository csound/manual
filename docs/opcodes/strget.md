<!--
id:strget
category:Strings:Definition
-->
# strget
Set  a string variable at initialization time to the value stored in [strset](../opcodes/strset.md) table at the specified index, or a string p-field from the score.

If there is no string defined for the index, the variable is set to an empty string.

## Syntax
=== "Modern"
    ``` csound-orc
    Sdst = strget(indx)
    ```

=== "Classic"
    ``` csound-orc
    Sdst strget indx
    ```

### Initialization

_indx_ -- strset index, or score p-field

_Sdst_ -- destination string variable

## Examples

Here is an example of the strget opcode. It uses the file [strget.csd](../examples/strget.csd).

``` csound-csd title="Example of the strget opcode." linenums="1"
--8<-- "examples/strget.csd"
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga

2005
