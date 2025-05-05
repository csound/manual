<!--
id:tabw
category:Signal Generators:Table Access
-->
# tabw
Fast table opcodes.

Faster than [tablew](../opcodes/tablew.md) because it does not allow wrap-around and limit. Has been implemented in order to provide fast access to arrays.

## Syntax
=== "Modern"
    ``` csound-orc
    tabw(ksig, kndx, ifn [,ixmode])
    tabw(asig, andx, ifn [,ixmode])
    ```

=== "Classic"
    ``` csound-orc
    tabw ksig, kndx, ifn [,ixmode]
    tabw asig, andx, ifn [,ixmode]
    ```

### Initialization

_ifn_ -- table number

_ixmode_ -- defaults to zero.  If zero _xndx_ range matches the length of the table; if non zero _xndx_ has a 0 to 1 range.

### Performance

_andx, kndx_ -- table index.

_tabw_ opcode is similar to _tablew_ but are faster, and use rounding of the index.

Special care of index value must be taken into account. Index values out of the table allocated space will crash Csound.

## Examples

Here is an example of the tabw opcode. It uses the file [tabw.csd](../examples/tabw.csd).

``` csound-orc title="Example of the tabw opcode." linenums="1"
--8<-- "examples/tabw.csd"
```

## See Also

[Table Access](../siggen/tableacc.md)

## Credits

Written by Gabriel Maldonado.
