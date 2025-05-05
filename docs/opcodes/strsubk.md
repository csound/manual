<!--
id:strsubk
category:Strings:Manipulation
-->
# strsubk
Extract a substring of the source string.

_strsubk_ runs both at init and performance time.

## Syntax
=== "Modern"
    ``` csound-orc
    Sdst = strsubk(Ssrc, kstart, kend)
    ```

=== "Classic"
    ``` csound-orc
    Sdst strsubk Ssrc, kstart, kend
    ```

### Performance

_kstart_ -- start position in Ssrc, counting from 0. A negative value means the end of the string.

_kend_ -- end position in Ssrc, counting from 0. A negative value means the end of the string. If kend is less than kstart, the output is reversed.

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2006<br>
