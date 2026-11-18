<!--
id:stmcurrent
category:Instrument Control:State Machine Graphs
-->
# stmcurrent

Returns the name of the current node of a runner.

Use it to choose which code to run in the current control period, typically with [strcmpk](strcmpk.md).

## Syntax

=== "Modern"
    ``` csound-orc
    Snode = stmcurrent(irunner)
    ```

=== "Classic"
    ``` csound-orc
    Snode stmcurrent irunner
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_Snode_ -- the name of the current node, updated in every control period. It is empty at initialization.

The value is the one at the moment of the call. Before [stmadvance](stmadvance.md) it is the node for this control period; after it, it already reflects the move just applied.

This opcode only reads the runner. Any number of instruments can use it at the same time.

## Examples

A texture moves through three nodes, Calm, Build and Burst. Each node is a UDO that writes a shared struct and asks for the next node with [stmnext](stmnext.md) when its time is up. The runner is created inside the instrument, so it lasts as long as the note. It uses the file [stm.csd](../examples/stm.csd).

``` csound-csd title="A state machine that shapes a texture." linenums="1"
--8<-- "examples/stm.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmcurrentid](stmcurrentid.md), [stmnext](stmnext.md), [stmadvance](stmadvance.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
