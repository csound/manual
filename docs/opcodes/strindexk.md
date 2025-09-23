<!--
id:strindexk
category:Strings:Manipulation
-->
# strindexk
Return the position of the first occurence of S2 in S1, or -1 if not found. If S2 is empty, 0 is returned.

_strindexk_ runs both at init and performance time.

## Syntax
=== "Modern"
    ``` csound-orc
    kpos = strindexk(S1, S2)
    ```

=== "Classic"
    ``` csound-orc
    kpos strindexk S1, S2
    ```

## Examples

Here is an example of the strindexk opcode. It uses the file [strindexk.csd](../examples/strindexk.csd).

``` csound-csd title="Example of the strindexk opcode." linenums="1"
--8<-- "examples/strindexk.csd"
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2006<br>

New in version 5.02
