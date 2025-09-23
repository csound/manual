<!--
id:strtol
category:Strings:Conversion
-->
# strtol
Converts a string to a signed integer value (i-rate).

It is also possible to pass an strset index or a string p-field from the score instead of a string argument. If the string cannot be parsed as an integer number, an init error occurs and the instrument is deactivated.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = strtol(Sstr)
    ir = strtol(indx)
    ```

=== "Classic"
    ``` csound-orc
    ir strtol Sstr
    ir strtol indx
    ```

### Initialization

_Sstr_ -- String to convert.

_indx_ -- index of string set by strset

_strtol_ can parse numbers in decimal, octal (prefixed by 0), and hexadecimal (with a prefix of 0x) format.

### Performance

_ir_ -- Value of string as signed integer.

## See Also

[String Conversion Opcodes](../strings/convert.md)

## Credits

Author: Istvan Varga<br>
2005<br>
