<!--
id:ptable3
category:Signal Generators:Table Access
status:deprecated
-->
# ptable3
Accesses table values by direct indexing with cubic interpolation.

## Syntax
``` csound-orc
ares ptable3 andx, ifn [, ixmode] [, ixoff] [, iwrap]
ires ptable3 indx, ifn [, ixmode] [, ixoff] [, iwrap]
kres ptable3 kndx, ifn [, ixmode] [, ixoff] [, iwrap]
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

_ptable3_ is identical to [table3](../opcodes/table3.md), except
that it uses does not require the table to have a power of two size.

## See Also

[table](../opcodes/table.md),
[tablei](../opcodes/tablei.md),
[table3](../opcodes/table3.md),
[ptable](../opcodes/ptable.md),
[ptablei](../opcodes/ptablei.md),
[oscil1](../opcodes/oscil1.md),
[oscil1i](../opcodes/oscil1i.md),
[osciln](../opcodes/osciln.md)

## Credits

Author: John ffitch<br>
Jan 2012<br>

New in Csound version 5.16
