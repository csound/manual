<!--
id:inletf
category:Signal Flow Graph Opcodes
-->
# inletf
Receives an frate signal (fsig) into an instrument from a named port.

Plugin opcode in signalflowgraph

## Syntax
=== "Modern"
    ``` csound-orc
    fsignal = inletf(Sname)
    ```

=== "Classic"
    ``` csound-orc
    fsignal inletf Sname
    ```

### Initialization

_Sname_ -- String name of the inlet port. The name of the inlet is implicitly qualified by the instrument name or number, so it is valid to use the same inlet name in more than one instrument (but not to use the same inlet name twice in one instrument).

### Performance

_ksignal_ -- frate input signal

During performance, the frate inlet signal is received from each instance of an instrument containing an outlet port to which this inlet has been connected using the [See also](../opcodes/connect.md)e>

[Signal Flow Graph Opcodes](../signalflowgraph.md)

More information on this opcode: [http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html](http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html), written by Michael Gogins

## Credits

By: Michael Gogins 2009
