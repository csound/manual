<!--
id:strtod
category:Strings:Conversion
-->
# strtod
Converts a string to a floating point value (i-rate).

It is also possible to pass an strset index or a string p-field from the score instead of a string argument. If the string cannot be parsed as a floating point or integer number, an init or perf error occurs and the instrument is deactivated.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = strtod(Sstr)
    ir = strtod(indx)
    ```

=== "Classic"
    ``` csound-orc
    ir strtod Sstr
    ir strtod indx
    ```

### Initialization

_Sstr_ -- String to convert.

_indx_ -- index of string set by strset

### Performance

_ir_ -- Value of string as float.

## See Also

[String Conversion Opcodes](../strings/convert.md)

## Credits

Author: Istvan Varga<br>
2005<br>
