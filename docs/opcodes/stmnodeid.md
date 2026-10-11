<!--
id:stmnodeid
category:Instrument Control:State Machine Graphs
-->
# stmnodeid

Returns the id of a node from its name.

## Syntax

=== "Modern"
    ``` csound-orc
    kid = stmnodeid(irunner, Sname)
    ```

=== "Classic"
    ``` csound-orc
    kid stmnodeid irunner, Sname
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_Sname_ -- the name of a node. An unknown name causes a performance error.

_kid_ -- the id of the node: its position in the order the nodes were added, from 0.

This opcode only reads the runner. Any number of instruments can use it at the same time.

## Examples

A scripted run of a small graph. It prints, for each control period, the current node and the graph clock as read before [stmadvance](stmadvance.md), the request made, and what `stmadvance` returned. Each control period lasts 10 ms. It uses the file [stm-trace.csd](../examples/stm-trace.csd).

``` csound-csd title="A scripted run showing every advance status." linenums="1"
--8<-- "examples/stm-trace.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmnodename](stmnodename.md), [stmcurrentid](stmcurrentid.md), [stmnext](stmnext.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
