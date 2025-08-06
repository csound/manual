<!--
id:subinstr
category:Instrument Control:Subinstrument Control
-->
# subinstr
Creates and runs a numbered instrument instance as if it were an opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    a1, [...] [, a8] = subinstr(instrnum [, p4] [, p5] [...])
    a1, [...] [, a8] = subinstr("insname" [, p4] [, p5] [...])
    ```

=== "Classic"
    ``` csound-orc
    a1, [...] [, a8] subinstr instrnum [, p4] [, p5] [...]
    a1, [...] [, a8] subinstr "insname" [, p4] [, p5] [...]
    ```

### Initialization

_instrnum_ -- Number of the instrument to be called.

_&#8220;insname&#8221;_ -- A string (in double-quotes) representing a named instrument.

### Performance

_a1, ..., a8_ --  The audio output from the called instrument. This is generated using the [signal output](../sigio/output.md) opcodes.

_p4, p5, ..._ -- Additional input values the are mapped to the called instrument p-fields, starting with p4.

The called instrument's p2 and p3 values will be identical to the host instrument's values. While the host instrument can [control its own duration](../control/durctl.md), any such attempts inside the called instrument will most likely have no effect.

> :memo: **Note**
>
> Only unparenthesized accessors like `p4` can read the actual parameter values passed to subinstruments. In contrast, in a subinstrument, opcodes calls relating to parameters like `p(4)` return the host's `p4`, and so does `passign`. Furthermre, `pcount` returns the host's parameter count, not the subinsturment's.

## Examples

=== "Modern"
    Here is an example of the subinstr opcode. It uses the file [subinstr-modern.csd](../examples/subinstr-modern.csd).
    ``` csound-csd title="Example of the subinstr opcode." linenums="1"
    --8<-- "examples/subinstr-modern.csd"
    ```

=== "Classic"
    Here is an example of the subinstr opcode. It uses the file [subinstr.csd](../examples/subinstr.csd).
    ``` csound-csd title="Example of the subinstr opcode." linenums="1"
    --8<-- "examples/subinstr.csd"
    ```

=== "Modern"
    Here is an example of the subinstr opcode using a named instrument. It uses the file [subinstr_named-modern.csd](../examples/subinstr_named-modern.csd).
    ``` csound-csd title="Example of the subinstr opcode using a named instrument." linenums="1"
    --8<-- "examples/subinstr_named-modern.csd"
    ```

=== "Classic"
    Here is an example of the subinstr opcode using a named instrument. It uses the file [subinstr_named.csd](../examples/subinstr_named.csd).
    ``` csound-csd title="Example of the subinstr opcode using a named instrument." linenums="1"
    --8<-- "examples/subinstr_named.csd"
    ```

## See also

[event](../opcodes/event.md), [schedule](../opcodes/schedule.md), [subinstrinit](../opcodes/subinstrinit.md)

[Sub-instrument Control](../control/subinstr.md)

## Credits

New in version 4.21
