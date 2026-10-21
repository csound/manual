<!--
id:stmnodetime
category:Instrument Control:State Machine Graphs
-->
# stmnodetime

Returns how long the current node of a runner has been current, in seconds.

It is the natural way to give a node a duration: request the next node when the node time passes a limit.

## Syntax

=== "Modern"
    ``` csound-orc
    ktime = stmnodetime(irunner)
    ```

=== "Classic"
    ``` csound-orc
    ktime stmnodetime irunner
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_ktime_ -- the graph time since the current node became current. It reads 0 in the node's first control period.

Every transition accepted by [stmadvance](stmadvance.md) restarts it, including a self transition. A rejected or conflicting request leaves it running, since the node did not change. [stmreset](stmreset.md) sets it to 0.

The clock of a runner is moved by [stmadvance](stmadvance.md), one control period per call. It is the state machine's own time: it stops while the runner is paused or deleted, and it does not follow performance time when the instrument that advances the runner is not running. Use [timeinstk](timeinstk.md) or [times](times.md) for performance time.

Read the clock before `stmadvance`: after it, the clock already shows the values of the next control period.

This opcode only reads the runner. Any number of instruments can use it at the same time.

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

[stmtime](stmtime.md), [stmtick](stmtick.md), [stmadvance](stmadvance.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
