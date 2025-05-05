<!--
id:tableng
category:Table Control:Table Queries
-->
# tableng
Interrogates a function table for length.

## Syntax
=== "Modern"
    ``` csound-orc
    ires = tableng(ifn)
    kres = tableng(kfn)
    ```

=== "Classic"
    ``` csound-orc
    ires tableng ifn
    kres tableng kfn
    ```

### Initialization

_ifn_ -- Table number to be interrogated

### Performance

_kfn_ -- Table number to be interrogated

_tableng_ returns the length of the specified table. This will be a power of two number in most circumstances. It will not show whether a table has a guardpoint or not. It seems this information is not available in the table's data structure. If the specified table is not found, then 0 will be returned.

Likely to be useful for setting up code for table manipulation operations, such as [tablemix](../opcodes/tablemix.md) and [tablecopy](../opcodes/tablecopy.md).

## Examples

Here is an example of the tableng opcode. It uses the file [tableng.csd](../examples/tableng.csd).

``` csound-csd title="Example of the tableng opcode." linenums="1"
--8<-- "examples/tableng.csd"
```

Its output should include a line like this:

```
instr 1:  isize = 115506.000
```

## See also

[Table Control:Table Queries](../table/queries.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>
