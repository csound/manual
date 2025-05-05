<!--
id:strtolk
category:Strings:Conversion
-->
# strtolk
Converts a string to a signed integer value at i- or k-rate.

It is also possible to pass an strset index or a string p-field from the score instead of a string argument. If the string cannot be parsed as an integer number, an init or perf error occurs and the instrument is deactivated.

> :memo: **Note**
>
> If a k-rate index variable is used, it should be valid at i-time as well.

## Syntax
=== "Modern"
    ``` csound-orc
    kr = strtolk(Sstr)
    kr = strtolk(kndx)
    ```

=== "Classic"
    ``` csound-orc
    kr strtolk Sstr
    kr strtolk kndx
    ```

_strtolk_ can parse numbers in decimal, octal (prefixed by 0), and hexadecimal (with a prefix of 0x) format.

### Performance

_kr_ -- Value of string as signed integer.

_Sstr_ -- String to convert.

_indx_ -- index of string set by strset

## See Also

[String Conversion Opcodes](../strings/convert.md)

## Credits

Author: Istvan Varga<br>
2005<br>
