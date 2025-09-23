<!--
id:strchar
category:Strings:Conversion
-->
# strchar
Return the ASCII code of the character in Sstr at ipos (defaults to zero which means the first character), or zero if ipos is out of range.

_strchar_ runs at init time only.

## Syntax
=== "Modern"
    ``` csound-orc
    ichr = strchar(Sstr [, ipos])
    ```

=== "Classic"
    ``` csound-orc
    ichr strchar Sstr [, ipos]
    ```

## Examples

Here is an example of the strchar opcode. It uses the file [strchar.csd](../examples/strchar.csd).

``` csound-csd title="Example of the strchar opcode." linenums="1"
--8<-- "examples/strchar.csd"
```

## See Also

[String Conversion Opcodes](../strings/convert.md)

## Credits

Author: Istvan Varga<br>
2006<br>
