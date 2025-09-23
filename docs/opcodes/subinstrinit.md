<!--
id:subinstrinit
category:Instrument Control:Subinstrument Control
-->
# subinstrinit
Creates and runs a numbered instrument instance at init-time.

Same as [subinstr](../opcodes/subinstr.md), but init-time only and has no output arguments.

## Syntax
=== "Modern"
    ``` csound-orc
    subinstrinit(instrnum [, p4] [, p5] [...])
    subinstrinit("insname" [, p4] [, p5] [...])
    ```

=== "Classic"
    ``` csound-orc
    subinstrinit instrnum [, p4] [, p5] [...]
    subinstrinit "insname" [, p4] [, p5] [...]
    ```

### Initialization

_instrnum_ -- Number of the instrument to be called.

_&#8220;insname&#8221;_ -- A string (in double-quotes) representing a named instrument.

_p4, p5, ..._ -- Additional input values the are mapped to the called instrument p-fields, starting with p4.

The called instrument's p2 and p3 values will be identical to the host instrument's values. While the host instrument can [control its own duration](../control/durctl.md), any such attempts inside the called instrument will most likely have no effect.

## Examples

=== "Modern"
    Here is an example of the subinstrinit opcode. It uses the file [subinstrinit-modern.csd](../examples/subinstrinit-modern.csd).
    ``` csound-csd title="Example of the subinstrinit opcode." linenums="1"
    --8<-- "examples/subinstrinit-modern.csd"
    ```

=== "Classic"
    Here is an example of the subinstrinit opcode. It uses the file [subinstrinit.csd](../examples/subinstrinit.csd).
    ``` csound-csd title="Example of the subinstrinit opcode." linenums="1"
    --8<-- "examples/subinstrinit.csd"
    ```

Its output should include lines like this:

```
instr. 2 playing
B  0.000 ..  2.000 T  2.000 TT  2.000 M:  0.00000  0.00000
instr. 3 playing
B  2.000 ..  4.000 T  4.000 TT  4.000 M:  0.00000  0.00000
instr. 4 playing
B  4.000 ..  6.000 T  6.000 TT  6.000 M:  0.00000  0.00000
.........
```

## See also

[Sub-instrument Control](../control/subinstr.md)

## Credits

New in version 4.23
