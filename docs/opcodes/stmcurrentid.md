<!--
id:stmcurrentid
category:Instrument Control:State Machine Graphs
-->
# stmcurrentid

Returns the id of the current node of a runner.

Node ids are integers from 0, assigned in the order the nodes were added. Dispatching on the id avoids comparing strings.

## Syntax

=== "Modern"
    ``` csound-orc
    kid = stmcurrentid(irunner)
    ```

=== "Classic"
    ``` csound-orc
    kid stmcurrentid irunner
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_kid_ -- the id of the current node.

This opcode only reads the runner. Any number of instruments can use it at the same time.

## Examples

A scripted run of a small graph. It prints, for each control period, the current node and the graph clock as read before [stmadvance](stmadvance.md), the request made, and what `stmadvance` returned. Each control period lasts 10 ms. It uses the file [stm-trace.csd](../examples/stm-trace.csd).

``` csound-csd title="A scripted run showing every advance status." linenums="1"
--8<-- "examples/stm-trace.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmcurrent](stmcurrent.md), [stmnodeid](stmnodeid.md), [stmnodename](stmnodename.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
