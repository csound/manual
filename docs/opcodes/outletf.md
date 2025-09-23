<!--
id:outletf
category:Signal Flow Graph Opcodes
-->
# outletf
Sends a frate signal (fsig) out from an instrument to a named port.

Plugin opcode in signalflowgraph

## Syntax
=== "Modern"
    ``` csound-orc
    outletf(Sname, fsignal)
    ```

=== "Classic"
    ``` csound-orc
    outletf Sname, fsignal
    ```

### Initialization

_Sname_ -- String name of the outlet port. The name of the outlet is implicitly qualified by the instrument name or number, so it is valid to use the same outlet name in more than one instrument (but not to use the same outlet name twice in one instrument).

### Performance

_fsignal_ -- frate output signal (fsig)

During performance, the output signal is sent to each instance of an instrument containing an inlet port to which this outlet has been connected using the [See also](../opcodes/connect.md)e>

[Signal Flow Graph Opcodes](../signalflowgraph.md)

More information on this opcode: [http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html](http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html), written by Michael Gogins

## Credits

By: Michael Gogins 2009
