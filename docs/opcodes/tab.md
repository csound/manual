<!--
id:tab
category:Signal Generators:Table Access
-->
# tab
Fast table opcode.

Faster than [table](../opcodes/table.md) because it does not allow wrap-around and limit. Has been implemented in order to provide fast access to arrays.

## Syntax
=== "Modern"
    ``` csound-orc
    kr = tab(kndx, ifn[, ixmode])
    ar = tab(xndx, ifn[, ixmode])
    ```

=== "Classic"
    ``` csound-orc
    kr tab kndx, ifn[, ixmode]
    ar tab xndx, ifn[, ixmode]
    ```

### Initialization

_ifn_ -- table number

_ixmode_ -- defaults to zero.  If zero _xndx_ range matches the length of the table; if non zero _xndx_ has a 0 to 1 range.

_indx_ -- table index

### Performance

_andx, kndx_ -- table index.

_tab_ and _tabw_ opcodes are similar to _table_ but are faster, and use rounding of the index.

## Examples

Here is an example of the tab opcode. It uses the file [tab.csd](../examples/tab.csd).

``` csound-orc title="Example of the tab opcode." linenums="1"
--8<-- "examples/tab.csd"
```

## See Also

[Table Access](../siggen/tableacc.md)

## Credits

Written by Gabriel Maldonado.
