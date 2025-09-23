<!--
id:inletkid
category:Signal Flow Graph Opcodes
-->
# inletkid
Receives a krate signal into an instrument from a named port.

Plugin opcode in signalflowgraph

## Syntax
=== "Modern"
    ``` csound-orc
    ksignal = inletkid(Sname, SinstanceID)
    ```

=== "Classic"
    ``` csound-orc
    ksignal inletkid Sname, SinstanceID
    ```

### Initialization

_Sname_ -- String name of the inlet port. The name of the inlet is implicitly qualified by the instrument name or number, so it is valid to use the same inlet name in more than one instrument (but not to use the same inlet name twice in one instrument).

_SinstanceID_ -- String name of the outlet port's instance ID. This enables the inlet to discriminate between different instances of the outlet, e,g. one instance of the outlet might be created by a note specifying one instance ID, and another instance might be created by a note specifying another ID. This might be used, e.g., to situate difference instances of an instrument at different points in an Ambisonic space in a spatializing effects processor.

### Performance

_ksignal_ -- krate input signal

During performance, the krate inlet signal is received from each instance of an instrument containing an outlet port to which this inlet has been connected using the
[See also](../opcodes/connect.md)e>

[Signal Flow Graph Opcodes](../signalflowgraph.md)

More information on this opcode: [http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html](http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html), written by Michael Gogins

## Credits

By: Michael Gogins 2009
