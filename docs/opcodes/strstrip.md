<!--
id:strstrip
category:Strings:Manipulation
-->
# strstrip
Strip whitespace from string.

Plugin opcode in emugens.

Whitespace can be removed from left, right or both sides. Works at init-time.

## Syntax
=== "Modern"
    ``` csound-orc
    Sout = strstrip(Sin [, Smode])
    ```

=== "Classic"
    ``` csound-orc
    Sout strstrip Sin [, Smode]
    ```

### Initialization

_Sin_ -- Input string

_Smode_ -- If not given, whitespace is stripped from both sides. If "l", strip whitespace from left side. If "r", strip whitespace from right side.

## Examples

Here is an example of the strstrip opcode. It uses the file [strstrip.csd](../examples/strstrip.csd).

``` csound-csd title="Example of the strstrip opcode." linenums="1"
--8<-- "examples/strstrip.csd"
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

By: Eduardo Moguillansky 2020
