<!--
id:ptable
category:Signal Generators:Table Access
status:deprecated
-->
# ptable
Accesses table values by direct indexing.

## Syntax
``` csound-orc
ares ptable andx, ifn [, ixmode] [, ixoff] [, iwrap]
ires ptable indx, ifn [, ixmode] [, ixoff] [, iwrap]
kres ptable kndx, ifn [, ixmode] [, ixoff] [, iwrap]
```

### Initialization

_ifn_ -- function table number.

_ixmode_ (optional) -- index data mode. The default value is 0.

* 0 = raw index
* 1 = normalized (0 to 1)

_ixoff_ (optional) -- amount by which index is to be offset. For a table with origin at center, use tablesize/2 (raw) or 0.5 (normalized). The default value is 0.

_iwrap_ (optional) -- wraparound index flag. The default value is 0.

*  0 = nowrap (index &lt; 0 treated as index=0; index &gt; tablesize sticks at index=size)
*  1 = wraparound.

### Performance

_ptable_ invokes table lookup on behalf of init, control or audio indices. These indices can be raw entry numbers (0, 1, 2,... size - 1) or scaled values (0 to 1). Indices are first modified by the offset value then checked for range before table lookup (see _iwrap_). If index is likely to be full scale, or if interpolation is being used, the table should have an extended guard point. _table_ indexed by a periodic phasor ( see [phasor](../opcodes/phasor.md)) will simulate an oscillator.

## Examples

Here is an example of the ptable opcode. It uses the file [ptable.csd](../examples/ptable.csd).
``` csound-csd title="Example of the ptable opcode." linenums="1"
--8<-- "examples/ptable.csd"
```

## See Also

[table](../opcodes/table.md),
[tablei](../opcodes/tablei.md),
[table3](../opcodes/table3.md),
[ptable3](../opcodes/ptable3.md),
[ptablei](../opcodes/ptablei.md),
[oscil1](../opcodes/oscil1.md),
[oscil1i](../opcodes/oscil1i.md),
[osciln](../opcodes/osciln.md)

## Credits

Author: John ffitch<br>
Jan 2012<br>

New in Csound version  5.16
