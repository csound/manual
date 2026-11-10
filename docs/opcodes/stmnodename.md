<!--
id:stmnodename
category:Instrument Control:State Machine Graphs
-->
# stmnodename

Returns the name of a node from its id.

## Syntax

=== "Modern"
    ``` csound-orc
    Sname = stmnodename(irunner, kid)
    ```

=== "Classic"
    ``` csound-orc
    Sname stmnodename irunner, kid
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_kid_ -- the id of a node, an integer from 0 to the number of nodes minus 1. Any other value causes a performance error.

_Sname_ -- the name of the node.

This opcode only reads the runner. Any number of instruments can use it at the same time.

## Examples

### A scripted run showing every advance status

A scripted run of a small graph. It prints, for each control period, the current node and the graph clock as read before [stmadvance](stmadvance.md), the request made, and what `stmadvance` returned. Each control period lasts 10 ms. It uses the file [stm-trace.csd](../examples/stm-trace.csd).

``` csound-csd title="A scripted run showing every advance status." linenums="1"
--8<-- "examples/stm-trace.csd"
```

### A state machine that shapes a texture

A texture moves through three nodes, Calm, Build and Burst. Each node is a UDO that writes a shared struct and asks for the next node with [stmnext](stmnext.md) when its time is up. The runner is created inside the instrument, so it lasts as long as the note. It uses the file [stm.csd](../examples/stm.csd).

``` csound-csd title="A state machine that shapes a texture." linenums="1"
--8<-- "examples/stm.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmnodeid](stmnodeid.md), [stmcurrent](stmcurrent.md), [stmadvance](stmadvance.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
