<!--
id:tableigpw
category:Table Control:Read/Write Operations
-->
# tableigpw
Writes a table's guard point.

## Syntax
=== "Modern"
    ``` csound-orc
    tableigpw(ifn)
    ```

=== "Classic"
    ``` csound-orc
    tableigpw ifn
    ```

### Initialization

_ifn_ -- Table number to be interrogated

### Performance

_tableigpw_ -- For writing the table's guard point, with the value which is in location 0. Does nothing if table does not exist.

Likely to be useful after manipulating a table with [tablemix](../opcodes/tablemix.md) or [tablecopy.](../opcodes/tablecopy.md)

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.47
