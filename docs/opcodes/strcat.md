<!--
id:strcat
category:Strings:Manipulation
-->
# strcat
Concatenate two strings and store the result in a variable.

_strcat_ runs at i-time only. It is allowed for any of the input arguments to be the same as the output variable.

## Syntax
=== "Modern"
    ``` csound-orc
    Sdst = strcat(Ssrc1, Ssrc2)
    ```

=== "Classic"
    ``` csound-orc
    Sdst strcat Ssrc1, Ssrc2
    ```

## Examples

Here is an example of the strcat opcode. It uses the file [strcat.csd](../examples/strcat.csd).

``` csound-csd title="Example of the strcat opcode." linenums="1"
--8<-- "examples/strcat.csd"
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2005<br>

New in version 5.02
