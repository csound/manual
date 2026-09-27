<!--
id:strcpy
category:Strings:Manipulation
-->
# strcpy
Copies a string literal or string variable to another string variable.

`strcpy` and string assignment with `=` copy at initialization only. Use [strcpyk](strcpyk.md) to copy a string during performance.

## Syntax
=== "Modern"
    ``` csound-orc
    Sdst = strcpy(Ssrc)
    Sdst = Ssrc
    ```

=== "Classic"
    ``` csound-orc
    Sdst strcpy Ssrc
    Sdst = Ssrc
    ```

### Initialization

_Ssrc_ -- the source string, given as a literal or a string variable.

_Sdst_ -- the destination string variable. It receives a copy of the source. Later changes to the source leave this copy unchanged.

## Examples

These examples copy a literal into a source variable, then copy it with both `strcpy` and `=`. They change the source and print all three strings. They run without audio output or external files.

=== "Modern"
    [strcpy-modern.csd](../examples/strcpy-modern.csd)
    ``` csound-csd title="Copy strings at initialization" linenums="1"
    --8<-- "examples/strcpy-modern.csd"
    ```

=== "Classic"
    [strcpy.csd](../examples/strcpy.csd)
    ``` csound-csd title="Copy strings at initialization" linenums="1"
    --8<-- "examples/strcpy.csd"
    ```

Both examples print these values.

``` text
Source = Goodbye.
Copy = Hello, world!
Assignment = Hello, world!
```

## See Also

[strcpyk](strcpyk.md), [String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2005<br>
