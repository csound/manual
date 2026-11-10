<!--
id:stmreset
category:Instrument Control:State Machine Graphs
-->
# stmreset

Returns a runner to its entry node and restarts its clock.

## Syntax

=== "Modern"
    ``` csound-orc
    stmreset(irunner, ktrig)
    ```

=== "Classic"
    ``` csound-orc
    stmreset irunner, ktrig
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_ktrig_ -- the action happens when _ktrig_ becomes greater than 0, that is on the first pass where it is positive after being 0 or less. A trigger that is positive on the very first pass also counts. Holding _ktrig_ high does not repeat the action.

A reset moves the runner to its entry node, clears the pending request and sets the tick count, the graph time and the node time to 0. If the runner was on another node, the reset is recorded as an event (kind 3) and counts as a transition for [stmonenter](stmonenter.md) and [stmonexit](stmonexit.md). An [stmadvance](stmadvance.md) in the same control period does not move the restarted clock.

A reset does not resume a paused runner, and it does not clear the event history or the states saved with [stmcall](stmcall.md). It is ignored once the runner is deleted.

This opcode changes the runner, so it counts as a writer: a runner accepts writers from one instrument instance at a time. See [Writers and observers](../control/stm.md#writers-and-observers).

## Examples

A scripted run of a small graph. It prints, for each control period, the current node and the graph clock as read before [stmadvance](stmadvance.md), the request made, and what `stmadvance` returned. Each control period lasts 10 ms. It uses the file [stm-trace.csd](../examples/stm-trace.csd).

``` csound-csd title="A scripted run showing every advance status." linenums="1"
--8<-- "examples/stm-trace.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmentry](stmentry.md), [stmpause](stmpause.md), [stmrecall](stmrecall.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
