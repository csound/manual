<!--
id:tablegpw
category:Table Control:Read/Write Operations
-->
# tablegpw
Writes a table's guard point.

## Syntax
``` csound-orc
tablegpw kfn
```

### Performance

_kfn_ -- Table number to be interrogated

_tablegpw_ -- For writing the table's guard point, with the value which is in location 0. Does nothing if table does not exist.

Likely to be useful after manipulating a table with [tablemix](../../opcodes/tablemix) or [tablecopy](../../opcodes/tablecopy).

## See also

[Read/Write Operations](../../table/readwrit)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.47
