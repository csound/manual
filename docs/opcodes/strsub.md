<!--
id:strsub
category:Strings:Manipulation
-->
# strsub
Extract a substring of the source string.

_strsub_ runs at init time only.

## Syntax
=== "Modern"
    ``` csound-orc
    Sdst = strsub(Ssrc [, istart[, iend]])
    ```

=== "Classic"
    ``` csound-orc
    Sdst strsub Ssrc [, istart[, iend]]
    ```

### Initialization

_istart_ (optional, defaults to 0) -- start position in Ssrc, counting from 0. A negative value means the end of the string.

_iend_ (optional, defaults to -1) -- end position in Ssrc, counting from 0. A negative value means the end of the string. If iend is less than istart, the output is reversed.

## Examples

Here is an example of the strsub opcode. It uses the file [strsub.csd](../examples/strsub.csd).

``` csound-csd title="Example of the strsub opcode." linenums="1"
--8<-- "examples/strsub.csd"
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2006<br>
