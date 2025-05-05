<!--
id:tabw_i
category:Signal Generators:Table Access
-->
# tabw_i
Fast table opcodes.

Faster than [tablew](../opcodes/tablew.md) because it does not allow wrap-around and limit. Has been implemented in order to provide fast access to arrays.

## Syntax
=== "Modern"
    ``` csound-orc
    tabw_i(isig, indx, ifn [,ixmode])
    ```

=== "Classic"
    ``` csound-orc
    tabw_i isig, indx, ifn [,ixmode]
    ```

### Initialization

_ifn_ -- table number

_ixmode_ -- defaults to zero.  If zero _indx_ range matches the length of the table; if non zero _xndx_ has a 0 to 1 range.

_isig_ -- input value to write.

_indx_ -- table index

### Performance

_tabw_i_ opcode is similar to _tablew_ but is faster, and use rounding of the index.

## See Also

[Table Access](../siggen/tableacc.md)

## Credits

Written by Gabriel Maldonado.
