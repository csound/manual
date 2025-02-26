<!--
id:subinstr
category:Instrument Control:Subinstrument Control
-->
# subinstr
Creates and runs a numbered instrument instance as if it were an opcode.

## Syntax
``` csound-orc
a1, [...] [, a8] subinstr instrnum [, p4] [, p5] [...]
a1, [...] [, a8] subinstr "insname" [, p4] [, p5] [...]
```

### Initialization

_instrnum_ -- Number of the instrument to be called.

_&#8220;insname&#8221;_ -- A string (in double-quotes) representing a named instrument.

### Performance

_a1, ..., a8_ --  The audio output from the called instrument. This is generated using the [signal output](../../sigio/output) opcodes.

_p4, p5, ..._ -- Additional input values the are mapped to the called instrument p-fields, starting with p4.

The called instrument's p2 and p3 values will be identical to the host instrument's values. While the host instrument can [control its own duration](../../control/durctl), any such attempts inside the called instrument will most likely have no effect.

## Examples

Here is an example of the subinstr opcode. It uses the file [subinstr.csd](../../examples/subinstr.csd).

``` csound-csd title="Example of the subinstr opcode." linenums="1"
--8<-- "examples/subinstr.csd"
```

Here is an example of the subinstr opcode using a named instrument. It uses the file [subinstr_named.csd](../../examples/subinstr_named.csd).

``` csound-csd title="Example of the subinstr opcode using a named instrument." linenums="1"
--8<-- "examples/subinstr_named.csd"
```

## See also

[event](../../opcodes/event), [schedule](../../opcodes/schedule), [subinstrinit](../../opcodes/subinstrinit)

[Sub-instrument Control](../../control/subinstr)

## Credits

New in version 4.21
