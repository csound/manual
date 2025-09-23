<!--
id:strtodk
category:Strings:Conversion
-->
# strtodk
Converts a string to a floating point value at i- or k-rate.

It is also possible to pass an strset index or a string p-field from the score instead of  string argument. If the string cannot be parsed as a floating point or integer number, an init or perf error occurs and the instrument is deactivated.

> :memo: **Note**
>
> If a k-rate index variable is used, it should be valid at i-time as well.

## Syntax
=== "Modern"
    ``` csound-orc
    kr = strtodk(Sstr)
    kr = strtodk(kndx)
    ```

=== "Classic"
    ``` csound-orc
    kr strtodk Sstr
    kr strtodk kndx
    ```

### Performance

_kr_ -- Value of string as float.

_Sstr_ -- String to convert.

_indx_ -- index of string set by strset

## See Also

[String Conversion Opcodes](../strings/convert.md)

## Credits

Author: Istvan Varga<br>
2005<br>
