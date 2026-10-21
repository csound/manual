<!--
id:stmcreate
category:Instrument Control:State Machine Graphs
-->
# stmcreate

Creates an empty graph builder.

The builder is the mutable stage of a state machine graph. Add nodes and edges to it, then freeze it with [stmcompile](stmcompile.md). See [State Machine Graphs](../control/stm.md) for the whole workflow.

## Syntax

=== "Modern"
    ``` csound-orc
    ibuilder = stmcreate()
    ```

=== "Classic"
    ``` csound-orc
    ibuilder stmcreate
    ```

### Initialization

_ibuilder_ -- the handle of the new builder, a positive integer.

The builder belongs to the opcode instance that created it, and its handle is removed when that instance ends. Created in the global space, outside any instrument, it lasts for the whole performance. A definition compiled from it does not depend on it any more.

Up to 4096 builders, definitions and runners can exist at the same time in one Csound instance.

## Examples

A texture moves through three nodes, Calm, Build and Burst. Each node is a UDO that writes a shared struct and asks for the next node with [stmnext](stmnext.md) when its time is up. The runner is created inside the instrument, so it lasts as long as the note. It uses the file [stm.csd](../examples/stm.csd).

``` csound-csd title="A state machine that shapes a texture." linenums="1"
--8<-- "examples/stm.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmaddnode](stmaddnode.md), [stmaddedge](stmaddedge.md), [stmcompile](stmcompile.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
