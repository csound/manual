<!--
id:stmedgecount
category:Instrument Control:State Machine Graphs
-->
# stmedgecount

Returns the number of edges in the graph of a runner.

## Syntax

=== "Modern"
    ``` csound-orc
    kcount = stmedgecount(irunner)
    ```

=== "Classic"
    ``` csound-orc
    kcount stmedgecount irunner
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_kcount_ -- the total number of edges, including self edges. An edge added twice counts once.

This opcode only reads the runner. Any number of instruments can use it at the same time.

## Examples

A scripted run of a small graph. It prints, for each control period, the current node and the graph clock as read before [stmadvance](stmadvance.md), the request made, and what `stmadvance` returned. Each control period lasts 10 ms. It uses the file [stm-trace.csd](../examples/stm-trace.csd).

``` csound-csd title="A scripted run showing every advance status." linenums="1"
--8<-- "examples/stm-trace.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmnodecount](stmnodecount.md), [stmaddedge](stmaddedge.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
