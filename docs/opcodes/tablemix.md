<!--
id:tablemix
category:Table Control:Read/Write Operations
-->
# tablemix
Mixes two tables.

## Syntax
=== "Modern"
    ``` csound-orc
    tablemix(kdft, kdoff, klen, ks1ft, ks1off, ks1g, ks2ft, ks2off, ks2g)
    ```

=== "Classic"
    ``` csound-orc
    tablemix kdft, kdoff, klen, ks1ft, ks1off, ks1g, ks2ft, ks2off, ks2g
    ```

### Performance

_kdft_ -- Destination function table.

_kdoff_ -- Offset to start writing from. Can be negative.

_klen_ -- Number of write operations to perform. Negative means work backwards.

_ks1ft_, _ks2ft_ -- Source function tables. These can be the same as the destination table, if care is exercised about direction of copying data.

_ks1off_, _ks2off_ -- Offsets to start reading from in source tables.

_ks1g_, _ks2g_ -- Gains to apply when reading from the source tables. The results are added and the sum is written to the destination table.

_tablemix_ -- This opcode mixes from two tables, with separate gains into the destination table. Writing is done for _klen_ locations, usually stepping forward through the table - if _klen_ is positive. If it is negative, then the writing and reading order is backwards - towards lower indexes in the tables. This bi-directional option makes it easy to shift the contents of a table sideways by reading from it and writing back to it with a different offset.

If _klen_ is 0, no writing occurs. Note that the internal integer value of _klen_ is derived from the ANSI C floor() function - which returns the next most negative integer. Hence a fractional negative _klen_ value of -2.3 would create an internal length of 3, and cause the copying to start from the offset locations and proceed for two locations to the left.

The total index for table reading and writing is calculated from the starting offset for each table, plus the index value, which starts at 0 and then increments (or decrements) by 1 as mixing proceeds.

These total indexes can potentially be very large, since there is no restriction on the offset or the _klen_. However each total index for each table is ANDed with a length mask (such as 0000 0111 for a table of length 8) to form a final index which is actually used for reading or writing. So no reading or writing can occur outside the tables. This is the same as &#8220;wrap&#8221; mode in table read and write. These opcodes do not read or write the guardpoint. If a table has been rewritten with one of these, then if it has a guardpoint which is supposed to contain the same value as the location 0, then call [tablegpw](../opcodes/tablegpw.md) afterwards.

The indexes and offsets are all in table steps - they are not normalized to 0 - 1. So for a table of length 256, _klen_ should be set to 256 if all the table was to be read or written.

The tables do not need to be the same length - wrapping occurs individually for each table.

## Examples

Here is an example of the tablemix opcode. It uses the file [tablemix.csd](../examples/tablemix.csd).

``` csound-csd title="Example of the tablemix opcode." linenums="1"
--8<-- "examples/tablemix.csd"
```

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.47
