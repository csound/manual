<!--
id:stmentry
category:Instrument Control:State Machine Graphs
-->
# stmentry

Sets the entry node of a graph builder.

Runners start from the entry node, and [stmreset](stmreset.md) returns them to it. Without `stmentry`, the entry node is the first node added, with id 0.

## Syntax

=== "Modern"
    ``` csound-orc
    stmentry(ibuilder, Snode)
    ```

=== "Classic"
    ``` csound-orc
    stmentry ibuilder, Snode
    ```

### Initialization

_ibuilder_ -- a builder handle, returned by [stmcreate](stmcreate.md).

_Snode_ -- the name of an existing node. An unknown name causes an initialization error.

`stmentry` must be called before [stmcompile](stmcompile.md); afterwards it causes an initialization error. If it is called more than once, the last call wins.

## Examples

A scripted run of a small graph. It prints, for each control period, the current node and the graph clock as read before [stmadvance](stmadvance.md), the request made, and what `stmadvance` returned. Each control period lasts 10 ms. It uses the file [stm-trace.csd](../examples/stm-trace.csd).

``` csound-csd title="A scripted run showing every advance status." linenums="1"
--8<-- "examples/stm-trace.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmaddnode](stmaddnode.md), [stmcompile](stmcompile.md), [stmreset](stmreset.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
