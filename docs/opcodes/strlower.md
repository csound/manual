<!--
id:strlower
category:Strings:Conversion
-->
# strlower
Convert Ssrc to lower case, and write the result to Sdst.

_strlower_ runs at init time only.

## Syntax
=== "Modern"
    ``` csound-orc
    Sdst = strlower(Ssrc)
    ```

=== "Classic"
    ``` csound-orc
    Sdst strlower Ssrc
    ```

## Examples

Here is an example of the strlower opcode. It uses the file [strlower.csd](../examples/strlower.csd).

``` csound-csd title="Example of the strlower opcode." linenums="1"
--8<-- "examples/strlower.csd"
```

## See Also

[String Conversion Opcodes](../strings/convert.md)

## Credits

Author: Istvan Varga<br>
2006<br>

New in version 5.02
