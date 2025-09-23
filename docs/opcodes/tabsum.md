<!--
id:tabsum
category:Table Control:Table Queries
-->
# tabsum
Sums the values in an f-table in a consecutive range.

## Syntax
=== "Modern"
    ``` csound-orc
    kr = tabsum(ifn[[, kmin] [, kmax]])
    ```

=== "Classic"
    ``` csound-orc
    kr tabsum ifn[[, kmin] [, kmax]]
    ```

### Initialization

_ifn_ -- table number

### Performance

_kr_ -- input signal to write.

_kmin, kmax_ -- range of the table to sum. If omitted or zero they default to 0 to length of the table.

## Examples

Here is an example of the tabsum opcode. It uses the file [tabsum.csd](../examples/tabsum.csd).

``` csound-csd title="Example of the tabsum opcode." linenums="1"
--8<-- "examples/tabsum.csd"
```

## See Also

[Vectorial opcodes](../vectorial/top.md)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2009<br>

New in version 5.11
