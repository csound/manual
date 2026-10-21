<!--
id:stmtime
category:Instrument Control:State Machine Graphs
-->
# stmtime

Returns the time of a runner's clock, in seconds.

## Syntax

=== "Modern"
    ``` csound-orc
    ktime = stmtime(irunner)
    ```

=== "Classic"
    ``` csound-orc
    ktime stmtime irunner
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_ktime_ -- the sum of the control periods advanced since the runner was created or last reset. A recall restores the value saved with the state.

The clock of a runner is moved by [stmadvance](stmadvance.md), one control period per call. It is the state machine's own time: it stops while the runner is paused or deleted, and it does not follow performance time when the instrument that advances the runner is not running. Use [timeinstk](timeinstk.md) or [times](times.md) for performance time.

Read the clock before `stmadvance`: after it, the clock already shows the values of the next control period.

Each advance adds the control period of the instrument or UDO that calls it, including local `setksmps`, `oversample` and `undersample` settings. The time is computed from an integer count, so it does not drift.

This opcode only reads the runner. Any number of instruments can use it at the same time.

## Examples

A scripted run of a small graph. It prints, for each control period, the current node and the graph clock as read before [stmadvance](stmadvance.md), the request made, and what `stmadvance` returned. Each control period lasts 10 ms. It uses the file [stm-trace.csd](../examples/stm-trace.csd).

``` csound-csd title="A scripted run showing every advance status." linenums="1"
--8<-- "examples/stm-trace.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmtick](stmtick.md), [stmnodetime](stmnodetime.md), [stmadvance](stmadvance.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
