<!--
id:stmnext
category:Instrument Control:State Machine Graphs
-->
# stmnext

Requests a transition to another node.

The request is not applied at once. The next [stmadvance](stmadvance.md) applies it if the current node has an edge to the requested node, and reports the outcome.

## Syntax

=== "Modern"
    ``` csound-orc
    stmnext(irunner, Snode)
    stmnext(irunner, knode)
    ```

=== "Classic"
    ``` csound-orc
    stmnext irunner, Snode
    stmnext irunner, knode
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_Snode_ -- the name of the requested node. An unknown name causes a performance error.

_knode_ -- the id of the requested node. It must be an integer from 0 to the number of nodes minus 1, otherwise a performance error is reported.

A runner has one pending request. The first request in a control period is kept, and repeating it is harmless. Requesting a different node before `stmadvance` is a conflict: the advance applies neither request and reports status 4.

Requests made while the runner is paused or deleted are ignored.

This opcode changes the runner, so it counts as a writer: a runner accepts writers from one instrument instance at a time. See [Writers and observers](../control/stm.md#writers-and-observers).

## Examples

### A state machine that shapes a texture

A texture moves through three nodes, Calm, Build and Burst. Each node is a UDO that writes a shared struct and asks for the next node with [stmnext](stmnext.md) when its time is up. The runner is created inside the instrument, so it lasts as long as the note. It uses the file [stm.csd](../examples/stm.csd).

``` csound-csd title="A state machine that shapes a texture." linenums="1"
--8<-- "examples/stm.csd"
```

### A scripted run showing every advance status

A scripted run of a small graph. It prints, for each control period, the current node and the graph clock as read before [stmadvance](stmadvance.md), the request made, and what `stmadvance` returned. Each control period lasts 10 ms. It uses the file [stm-trace.csd](../examples/stm-trace.csd).

``` csound-csd title="A scripted run showing every advance status." linenums="1"
--8<-- "examples/stm-trace.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmadvance](stmadvance.md), [stmaddedge](stmaddedge.md), [stmaddcondedge](stmaddcondedge.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
