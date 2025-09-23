<!--
id:strrindex
category:Strings:Manipulation
-->
# strrindex
Return the position of the last occurence of S2 in S1, or -1 if not found. If S2 is empty, the length of S1 is returned.

_strrindex_ runs at init time only.

## Syntax
=== "Modern"
    ``` csound-orc
    ipos = strrindex(S1, S2)
    ```

=== "Classic"
    ``` csound-orc
    ipos strrindex S1, S2
    ```

## Examples

Here is an example of the strrindex opcode. It uses the file [strrindex.csd](../examples/strrindex.csd).

``` csound-csd title="Example of the strrindex opcode." linenums="1"
--8<-- "examples/strrindex.csd"
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2006<br>

New in version 5.02
