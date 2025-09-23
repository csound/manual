<!--
id:strcpyk
category:Strings:Manipulation
-->
# strcpyk
Assign to a string variable by copying the source which may be a constant or another string variable.

_strcpyk_ does the assignment both at initialization and performance time.

## Syntax
=== "Modern"
    ``` csound-orc
    Sdst = strcpyk(Ssrc)
    ```

=== "Classic"
    ``` csound-orc
    Sdst strcpyk Ssrc
    ```

## Examples

Here is an example of the strcpyk opcode. It uses the file [strcpyk.csd](../examples/strcpyk.csd).

``` csound-csd title="Example of the strcpyk opcode." linenums="1"
--8<-- "examples/strcpyk.csd"
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2005<br>
