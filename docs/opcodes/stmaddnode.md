<!--
id:stmaddnode
category:Instrument Control:State Machine Graphs
-->
# stmaddnode

Adds a named node to a graph builder.

## Syntax

=== "Modern"
    ``` csound-orc
    stmaddnode(ibuilder, Sname)
    ```

=== "Classic"
    ``` csound-orc
    stmaddnode ibuilder, Sname
    ```

### Initialization

_ibuilder_ -- a builder handle, returned by [stmcreate](stmcreate.md).

_Sname_ -- the name of the node. Names are case-sensitive and must be unique within the graph: adding a name twice causes an initialization error.

Nodes get ids in the order they are added, starting from 0. The first node added is the entry node, unless [stmentry](stmentry.md) chooses another one.

Calling it after [stmcompile](stmcompile.md) has frozen the builder causes an initialization error.

## Examples

A scripted run of a small graph. It prints, for each control period, the current node and the graph clock as read before [stmadvance](stmadvance.md), the request made, and what `stmadvance` returned. Each control period lasts 10 ms. It uses the file [stm-trace.csd](../examples/stm-trace.csd).

``` csound-csd title="A scripted run showing every advance status." linenums="1"
--8<-- "examples/stm-trace.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmcreate](stmcreate.md), [stmaddedge](stmaddedge.md), [stmentry](stmentry.md), [stmnodeid](stmnodeid.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
