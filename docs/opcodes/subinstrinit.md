<!--
id:subinstrinit
category:Instrument Control:Subinstrument Control
-->
# subinstrinit
Runs the initialization code of a numbered or named instrument.

The called instrument can print messages or set up data at initialization. `subinstrinit` has no output arguments and does not run the called instrument at performance time. Its audio processing and audio output opcodes do not run. Use [subinstr](../opcodes/subinstr.md) when you need audio from the called instrument.

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

_p4, p5, ..._ -- Values passed to the called instrument as p4, p5, and so on.

The called instrument's p2 and p3 values will be identical to the host instrument's values. While the host instrument can [control its own duration](../control/durctl.md), any such attempts inside the called instrument will most likely have no effect.

## Examples

Instrument 1 uses its p4 to choose instrument 2, 3, or 4, then passes its p5 as the called instrument's p4. Each called instrument prints a message during initialization. This example makes no sound and needs no audio device.

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

The console output includes these messages. Each message appears once when the corresponding score event starts.

``` text
Instrument 2 initialized with p4 = 10
Instrument 3 initialized with p4 = 20
Instrument 4 initialized with p4 = 30
```

## See also

[Sub-instrument Control](../control/subinstr.md)

## Credits

New in version 4.23
