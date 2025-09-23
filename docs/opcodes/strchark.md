<!--
id:strchark
category:Strings:Conversion
-->
# strchark
Return the ASCII code of the character in Sstr at kpos (defaults to zero which means the first character), or zero if kpos is out of range.

_strchark_ runs both at init and performance time.

## Syntax
=== "Modern"
    ``` csound-orc
    kchr = strchark(Sstr [, kpos])
    ```

=== "Classic"
    ``` csound-orc
    kchr strchark Sstr [, kpos]
    ```

## See Also

[String Conversion Opcodes](../strings/convert.md)

## Credits

Author: Istvan Varga<br>
2006<br>

New in version 5.02
