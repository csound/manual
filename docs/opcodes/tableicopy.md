<!--
id:tableicopy
category:Table Control:Read/Write Operations
-->
# tableicopy
Simple, fast table copy opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    tableicopy(idft, isft)
    ```

=== "Classic"
    ``` csound-orc
    tableicopy idft, isft
    ```

### Initialization

_idft_ -- Destination function table.

_isft_ -- Number of source function table.

### Performance

_tableicopy_ -- Simple, fast table copy opcodes. Takes the table length from the destination table, and reads from the start of the source table. For speed reasons, does not check the source length - just copies regardless - in "wrap" mode. This may read through the source table several times. A source table with length 1 will cause all values in the destination table to be written to its value.

_tableicopy_ cannot read or write the guardpoint. To read it use [table](../opcodes/table.md), with _ndx_ = the table length. Likewise use table write to write it.

To write the guardpoint to the value in location 0, use [tablegpw](../opcodes/tablegpw.md).

This is primarily to change function tables quickly in a real-time situation.

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.47
