<!--
id:tableshuffle
category:Miscellaneous
-->
# tableshuffle
Shuffles the content of a function table.

Each element of the source table is put into a different random position, without loosing any of them. Imagine shuffling a deck of cards. Each element of the table is copied to a different random position. If that position was already chosen before then the next free position is chosen. The length of the table remains the same.

## Syntax
=== "Modern"
    ``` csound-orc
    tableshuffle(ktablenum)
    tableshufflei itablenum)
    ```

=== "Classic"
    ``` csound-orc
    tableshuffle ktablenum
    tableshufflei itablenum
    ```

### Performance

_ktablenum_ or _itablenum_
-- the number of the table to shuffle.

## Examples

Here is an example of the tableshuffle opcode. It uses the file [tableshuffle.csd](../examples/tableshuffle.csd).

``` csound-csd title="Example of the tableshuffle opcode." linenums="1"
--8<-- "examples/tableshuffle.csd"
```

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: Georg Boenn <br>
University of Glamorgan, UK<br>

New in Csound version 5.13
