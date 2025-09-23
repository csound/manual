<!--
id:table
category:Signal Generators:Table Access
-->
# table
Accesses table values by direct indexing.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = table(andx, ifn [, ixmode] [, ixoff] [, iwrap])
    ires = table(indx, ifn [, ixmode] [, ixoff] [, iwrap])
    kres = table(kndx, ifn [, ixmode] [, ixoff] [, iwrap])
    ```

=== "Classic"
    ``` csound-orc
    ares table andx, ifn [, ixmode] [, ixoff] [, iwrap]
    ires table indx, ifn [, ixmode] [, ixoff] [, iwrap]
    kres table kndx, ifn [, ixmode] [, ixoff] [, iwrap]
    ```

### Initialization

_ifn_ -- function table number.

_ixmode_ (optional) -- index data mode. The default value is 0.

* 0 = raw index
* 1 = normalized (0 to 1)

_ixoff_ (optional) -- amount by which index is to be offset. For a table with origin at center, use tablesize/2 (raw) or .5 (normalized). The default value is 0.

_iwrap_ (optional) -- wraparound index flag. The default value is 0.

*  0 = nowrap (index &lt; 0 treated as index=0; index &gt; tablesize sticks at index=size)
*  1 = wraparound.

### Performance

_table_ invokes table lookup on behalf of init, control or audio indices. These indices can be raw entry numbers (0,l,2...size - 1) or scaled values (0 to 1-e). Indices are first modified by the offset value then checked for range before table lookup (see _iwrap_). If index is likely to be full scale, or if interpolation is being used, the table should have an extended guard point. _table_ indexed by a periodic phasor ( see [phasor](../opcodes/phasor.md)) will simulate an oscillator.

## Examples

Here is an example of the table opcode. It uses the file [table.csd](../examples/table.csd).

``` csound-orc title="Example of the table opcode." linenums="1"
--8<-- "examples/table.csd"
```

## See Also

[Table Access](../siggen/tableacc.md)

More information on this opcode: [http://www.csoundjournal.com/issue12/genInstruments.html](http://www.csoundjournal.com/issue12/genInstruments.html)  , written by Jacob Joaquin
