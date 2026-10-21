<!--
id:stmaddedge
category:Instrument Control:State Machine Graphs
-->
# stmaddedge

Adds a directed edge between two nodes of a graph builder.

An edge allows the runner to move from one node to another. Edges have a direction: to move back and forth between two nodes, add one edge in each direction.

## Syntax

=== "Modern"
    ``` csound-orc
    stmaddedge(ibuilder, Sfrom, Sto)
    ```

=== "Classic"
    ``` csound-orc
    stmaddedge ibuilder, Sfrom, Sto
    ```

### Initialization

_ibuilder_ -- a builder handle, returned by [stmcreate](stmcreate.md).

_Sfrom_, _Sto_ -- the names of the source and target nodes. Both must already have been added with [stmaddnode](stmaddnode.md), otherwise an initialization error is reported.

An edge from a node to itself makes a self transition legal: the runner stays on the node, but [stmadvance](stmadvance.md) reports a transition, the node clock restarts and the enter and exit triggers fire. Adding an edge that already exists has no effect.

Calling it after [stmcompile](stmcompile.md) has frozen the builder causes an initialization error.

## Examples

A scripted run of a small graph. It prints, for each control period, the current node and the graph clock as read before [stmadvance](stmadvance.md), the request made, and what `stmadvance` returned. Each control period lasts 10 ms. It uses the file [stm-trace.csd](../examples/stm-trace.csd).

``` csound-csd title="A scripted run showing every advance status." linenums="1"
--8<-- "examples/stm-trace.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmaddcondedge](stmaddcondedge.md), [stmaddnode](stmaddnode.md), [stmnext](stmnext.md), [stmadvance](stmadvance.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
