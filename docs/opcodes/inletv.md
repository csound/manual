<!--
id:inletv
category:Signal Flow Graph Opcodes
-->
# inletv
Receives an arate array signal into an instrument through a named port.

Plugin opcode in signalflowgraph

## Syntax
=== "Modern"
    ``` csound-orc
    array = inletv(Sname)
    ```

=== "Classic"
    ``` csound-orc
    array inletv Sname
    ```

### Initialization

_Sname_ -- String name of the inlet port. The name of the inlet is implicitly qualified by the instrument name or number, so it is valid to use the same inlet name in more than one instrument (but not to use the same inlet name twice in one instrument).

### Performance

_array_ -- audio rate array inlet signal

During performance, the arate array inlet signal is received from each instance of an  instrument containing an outlet port to which this inlet has been connected using the [See also](../opcodes/connect.md)e>

[Signal Flow Graph Opcodes](../signalflowgraph.md)

More information on this opcode: [http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html](http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html), written by Michael Gogins

## Credits

By: Michael Gogins 2009
