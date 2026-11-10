<!--
id:stmcompile
category:Instrument Control:State Machine Graphs
-->
# stmcompile

Freezes a graph builder into an immutable definition.

The definition holds the nodes, the edges and the entry node. Runners are created from it with [stminstance](stminstance.md); one definition can back any number of runners.

## Syntax

=== "Modern"
    ``` csound-orc
    idef = stmcompile(ibuilder)
    ```

=== "Classic"
    ``` csound-orc
    idef stmcompile ibuilder
    ```

### Initialization

_ibuilder_ -- a builder handle, returned by [stmcreate](stmcreate.md).

_idef_ -- the handle of the new definition.

After `stmcompile`, the builder cannot be changed or compiled again: [stmaddnode](stmaddnode.md), [stmaddedge](stmaddedge.md), [stmaddcondedge](stmaddcondedge.md), [stmentry](stmentry.md) and a second `stmcompile` cause an initialization error. A builder without nodes cannot be compiled.

The definition belongs to the opcode instance that compiled it, and its handle is removed when that instance ends. Runners already created from it keep it alive.

## Examples

A texture moves through three nodes, Calm, Build and Burst. Each node is a UDO that writes a shared struct and asks for the next node with [stmnext](stmnext.md) when its time is up. The runner is created inside the instrument, so it lasts as long as the note. It uses the file [stm.csd](../examples/stm.csd).

``` csound-csd title="A state machine that shapes a texture." linenums="1"
--8<-- "examples/stm.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmcreate](stmcreate.md), [stminstance](stminstance.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
