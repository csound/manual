<!--
id:tablecopy
category:Table Control:Read/Write Operations
-->
# tablecopy
Simple, fast table copy opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    tablecopy(kdft, ksft)
    ```

=== "Classic"
    ``` csound-orc
    tablecopy kdft, ksft
    ```

### Performance

_kdft_ -- Destination function table.

_ksft_ -- Number of source function table.

_tablecopy_ -- Simple, fast table copy opcode. Takes the table length from the destination table, and reads from the start of the source table. For speed reasons, does not check the source length - just copies regardless - in &#8220;wrap&#8221; mode. This may read through the source table several times. A source table with length 1 will cause all values in the destination table to be written to its value.

_tablecopy_ cannot read or write the guardpoint. To read it use [table](../opcodes/table.md), with _ndx_ = the table length. Likewise use table write to write it.

To write the guardpoint to the value in location 0, use [tablegpw](../opcodes/tablegpw.md).

This is primarily to change function tables quickly in a real-time situation.

## Examples

Here is an example of the tablecopy opcode. It uses the file [tablecopy.csd](../examples/tablecopy.csd).

``` csound-csd title="Example of the tablecopy opcode." linenums="1"
--8<-- "examples/tablecopy.csd"
```

Its output should include a lines like these:

```
i1     5.00000
i1     3.00000
i1     2.00000
i1     4.00000
i1     7.00000
i1     6.00000
i1     7.00000
```

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.47
