<!--
id:tab_i
category:Signal Generators:Table Access
-->
# tab_i
Fast table opcodes.

Faster than [table](../opcodes/table.md) because it does not allow wrap-around and limit. Has been implemented in order to provide fast access to arrays.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = tab_i(indx, ifn[, ixmode])
    ```

=== "Classic"
    ``` csound-orc
    ir tab_i indx, ifn[, ixmode]
    ```

### Initialization

_ifn_ -- table number

_ixmode_ -- defaults to zero.  If zero _indx_ range matches the length of the table; if non zero _indx_ has a 0 to 1 range.

_indx_ -- table index

### Performance

_indx_ -- table index.

_tab_i_ opcode is similar to _table_ but is faster, and uses rounding of the index.

## See Also

[Table Access](../siggen/tableacc.md)

## Credits

Written by Gabriel Maldonado.
