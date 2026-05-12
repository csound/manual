<!--
id:ptablei
category:Signal Generators:Table Access
status:deprecated
-->
# ptablei
Accesses table values by direct indexing with linear interpolation.

## Syntax
``` csound-orc
ares ptablei andx, ifn [, ixmode] [, ixoff] [, iwrap]
ires ptablei indx, ifn [, ixmode] [, ixoff] [, iwrap]
kres ptablei kndx, ifn [, ixmode] [, ixoff] [, iwrap]
```

### Initialization

_ifn_ -- function table number.  The table need not be a power of 2 long.

_ixmode_ (optional) -- index data mode. The default value is 0.

* 0 = raw index
* 1 = normalized (0 to 1)

_ixoff_ (optional) -- amount by which index is to be offset. For a table with origin at center, use tablesize/2 (raw) or 0.5 (normalized). The default value is 0.

_iwrap_ (optional) -- wraparound index flag. The default value is 0.

*  0 = nowrap (index &lt; 0 treated as index=0; index &gt; tablesize sticks at index=size)
*  1 = wraparound.

### Performance

_ptablei_ is a interpolating unit in which the fractional part of index is used to interpolate between adjacent table entries. The smoothness gained by interpolation is at some small cost in execution time (see also [oscili](../opcodes/oscili.md), etc.), but the interpolating and non-interpolating units are otherwise interchangeable.

## Examples

Here is an example of the ptablei opcode. It uses the file [ptablei.csd](../examples/ptablei.csd).
``` csound-csd title="Example of the ptablei opcode." linenums="1"
--8<-- "examples/ptablei.csd"
```

## See Also

[table](../opcodes/table.md),
[tablei](../opcodes/tablei.md),
[table3](../opcodes/table3.md),
[ptable](../opcodes/ptable.md),
[ptable3](../opcodes/ptable3.md),
[oscil1](../opcodes/oscil1.md),
[oscil1i](../opcodes/oscil1i.md),
[osciln](../opcodes/osciln.md)

More information on this opcode: [http://www.csoundjournal.com/issue12/genInstruments.html](http://www.csoundjournal.com/issue12/genInstruments.html), written by Jacob Joaquin

## Credits

Author: John ffitch<br>
Jan 2012<br>

New in Csound version 5.16
