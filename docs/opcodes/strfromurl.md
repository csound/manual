<!--
id:strfromurl
category:Strings:Definition
-->
# strfromurl
Set a string variable to the value found from reading an URL.

## Syntax
=== "Modern"
    ``` csound-orc
    Sdst = strfromurl(StringURL)
    ```

=== "Classic"
    ``` csound-orc
    Sdst strfromurl StringURL
    ```

### Initialization

_StringURL_ -- string naming an URL.

_Sdst_ -- destination string variable

## Examples

Here is an example of the strfromurl opcode. It uses the file [strfromurl.csd](../examples/strfromurl.csd).

``` csound-csd title="Example of the strfromurl opcode." linenums="1"
--8<-- "examples/strfromurl.csd"
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: John ffitch<br>
2013

URLs available from Csound 6.02 if built with support
