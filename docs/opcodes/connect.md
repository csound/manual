<!--
id:connect
category:Signal Flow Graph Opcodes
-->
# connect
Connects a source outlet to a sink inlet.

Plugin opcode in signalflowgraph

The connect opcode, valid only in the orchestra header, sends the signals from the indicated outlet in all instances of the indicated source instrument to the indicated inlet in all instances of the indicated sink instrument. Each inlet instance receives the sum of the signals in all outlet instances. Thus multiple instances of an outlet may fan in to one instance of an inlet, or one instance of an outlet may fan out to multiple instances of an inlet.

When Csound creates a new instance of an instrument template, new instances of its connections also are created.

## Syntax
=== "Modern"
    ``` csound-orc
    connect(Tsource1, Soutlet1, Tsink1, Sinlet1)
    ```

=== "Classic"
    ``` csound-orc
    connect Tsource1, Soutlet1, Tsink1, Sinlet1
    ```

### Initialization

_Tsource1_ -- String name of the source instrument definition.

_Soutlet1_ -- String name of the source outlet in the source instrument.

_Tsink1_ -- String name of the sink instrument definition.

_Sinlet1_ -- String name of the sink inlet in the sink instrument.

## Examples

=== "Modern"
    Here is an example of the connect opcode. It uses the file [connect-modern.csd](../examples/connect-modern.csd).
    ``` csound-csd title="Example of the connect opcode." linenums="1"
    --8<-- "examples/connect-modern.csd"
    ```

=== "Classic"
    Here is an example of the connect opcode. It uses the file [connect.csd](../examples/connect.csd).
    ``` csound-csd title="Example of the connect opcode." linenums="1"
    --8<-- "examples/connect.csd"
    ```

## See also

[Signal Flow Graph Opcodes](../signalflowgraph.md)

More information on this opcode: [http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html](http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html), written by Michael Gogins

## Credits

By: Michael Gogins 2009
