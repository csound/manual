<!--
id:strindex
category:Strings:Manipulation
-->
# strindex
Return the position of the first occurence of S2 in S1, or -1 if not found. If S2 is empty, 0 is returned.

_strindex_ runs at init time only.

## Syntax
=== "Modern"
    ``` csound-orc
    ipos = strindex(S1, S2)
    ```

=== "Classic"
    ``` csound-orc
    ipos strindex S1, S2
    ```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2006<br>

New in version 5.02
