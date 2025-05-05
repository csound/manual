<!--
id:outletkid
category:Signal Flow Graph Opcodes
-->
# outletkid
Sends a krate signal out from an instrument to a named port.

Plugin opcode in signalflowgraph

## Syntax
=== "Modern"
    ``` csound-orc
    outletkid(Sname, SinstanceID, ksignal)
    ```

=== "Classic"
    ``` csound-orc
    outletkid Sname, SinstanceID, ksignal
    ```

### Initialization

_Sname_ -- String name of the outlet port. The name of the outlet is implicitly qualified by the instrument name or number, so it is valid to use the same outlet name in more than one instrument (but not to use the same outlet name twice in one instrument).

_SinstanceID_ -- String name of the outlet port's instance ID. This enables the inlet to discriminate between different instances of the outlet, e,g. one instance of the outlet might be created by a note specifying one instance ID, and another instance might be created by a note specifying another ID. This might be used, e.g., to situate difference instances of an instrument at different points in an Ambisonic space in a spatializing effects processor.

### Performance

_ksignal_ -- krate output signal

During performance, the krate output signal is sent to each instance of an instrument containing an inlet port to which this outlet has been connected using the [See also](../opcodes/connect.md)e>

[Signal Flow Graph Opcodes](../signalflowgraph.md)

More information on this opcode: [http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html](http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html), written by Michael Gogins

## Credits

By: Michael Gogins 2009
