<!--
id:trim
category:Array Opcodes
-->
# trim
Adjust size of a one-dimensional array.

> :warning: **Deprecated alias**
>
> `trim_i` is a deprecated alias of `trimi` in Csound 7. Use `trimi` in new code. The old name still works for compatibility.

## Syntax
=== "Modern"
    ``` csound-orc
    trimi(iarray, ilen)
    trim(xarray, klen)
    ```

=== "Classic"
    ``` csound-orc
    trim_i iarray, ilen
    trim xarray, klen
    ```

### Performance

_iarray_ -- a one-dimensional irate array

_xarray_ -- a one-dimensional array

_klen_ -- desired length

Makes the array the desired length, either truncating or padding with zero/Null values.

## Examples

=== "Modern"
    Here is an example of the trim opcode. It uses the file [trim-modern.csd](../examples/trim-modern.csd).

    ``` csound-csd title="Example of the trim opcode." linenums="1"
    --8<-- "examples/trim-modern.csd"
    ```

=== "Classic"
    Here is an example of the trim opcode. It uses the file [trim.csd](../examples/trim.csd).

    ``` csound-csd title="Example of the trim opcode." linenums="1"
    --8<-- "examples/trim.csd"
    ```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: John ffitch 2018

New in version 6.12
