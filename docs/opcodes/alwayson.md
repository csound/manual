<!--
id:alwayson
category:Signal Flow Graph Opcodes
-->
# alwayson
Activates the indicated instrument in the orchestra header, without need for an i statement.

Plugin opcode in signalflowgraph

Instruments must be activated in the same order as they are defined.

The alwayson opcode is designed to simplify the definition of re-usable orchestras with signal processing or effects chains and networks.

## Syntax
=== "Modern"
    ``` csound-orc
    alwayson(Tinstrument [, p4, ..., pn])
    ```

=== "Classic"
    ``` csound-orc
    alwayson Tinstrument [, p4, ..., pn]
    ```

### Initialization

_Tinstrument_ -- String name of the instrument definition to be turned on.

_[p4, ..., pn]_ -- Optional pfields to be passed to the instrument, in the same order and type as if this were an i statement.

When the instrument is activated, p1 is the insno, p2 is 0, and p3 is -1. Pfields from p4 on may optionally be sent to the instrument.

## Examples

=== "Modern"
    Here is an example of the alwayson opcode. It uses the file [alwayson-modern.csd](../examples/alwayson-modern.csd).
    ``` csound-csd title="Example of the alwayson opcode." linenums="1"
    --8<-- "examples/alwayson-modern.csd"
    ```

=== "Classic"
    Here is an example of the alwayson opcode. It uses the file [alwayson.csd](../examples/alwayson.csd).
    ``` csound-csd title="Example of the alwayson opcode." linenums="1"
    --8<-- "examples/alwayson.csd"
    ```

## See also

[Signal Flow Graph Opcodes](../signalflowgraph.md)

## Credits

By: Michael Gogins 2009
