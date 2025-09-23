<!--
id:tableimix
category:Table Control:Read/Write Operations
-->
# tableimix
Mixes two tables.

## Syntax
=== "Modern"
    ``` csound-orc
    tableimix(idft, idoff, ilen, is1ft, is1off, is1g, is2ft, is2off, is2g)
    ```

=== "Classic"
    ``` csound-orc
    tableimix idft, idoff, ilen, is1ft, is1off, is1g, is2ft, is2off, is2g
    ```

### Initialization

_idft_ -- Destination function table.

_idoff_ -- Offset to start writing from. Can be negative.

_ilen_ -- Number of write operations to perform. Negative means work backwards.

_is1ft_, _is2ft_ -- Source function tables. These can be the same as the destination table, if care is exercised about direction of copying data.

_is1off_, _is2off_ -- Offsets to start reading from in source tables.

_is1g_, _is2g_ -- Gains to apply when reading from the source tables. The results are added and the sum is written to the destination table.

### Performance

_tableimix_ -- This opcode mixes from two tables, with separate gains into the destination table. Writing is done for _ilen_ locations, usually stepping forward through the table - if _ilen_ is positive. If it is negative, then the writing and reading order is backwards - towards lower indexes in the tables. This bi-directional option makes it easy to shift the contents of a table sideways by reading from it and writing back to it with a different offset.

If _ilen_ is 0, no writing occurs. Note that the internal integer value of _ilen_ is derived from the ANSI C floor() function - which returns the next most negative integer. Hence a fractional negative _ilen_ value of -2.3 would create an internal length of 3, and cause the copying to start from the offset locations and proceed for two locations to the left.

The total index for table reading and writing is calculated from the starting offset for each table, plus the index value, which starts at 0 and then increments (or decrements) by 1 as mixing proceeds.

These total indexes can potentially be very large, since there is no restriction on the offset or the _ilen_. However each total index for each table is ANDed with a length mask (such as 0000 0111 for a table of length 8) to form a final index which is actually used for reading or writing. So no reading or writing can occur outside the tables. This is the same as &#8220;wrap&#8221; mode in table read and write. These opcodes do not read or write the guardpoint. If a table has been rewritten with one of these, then if it has a guardpoint which is supposed to contain the same value as the location 0, then call [tableigpw](../opcodes/tableigpw.md) afterwards.

The indexes and offsets are all in table steps - they are not normalized to 0 - 1. So for a table of length 256, _ilen_ should be set to 256 if all the table was to be read or written.

The tables do not need to be the same length - wrapping occurs individually for each table.

## Examples

Here is an example of the tableimix opcode. It uses the file [tableimix.csd](../examples/tableimix.csd).

``` csound-csd title="Example of the tableimix opcode." linenums="1"
--8<-- "examples/tableimix.csd"
```

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.47
