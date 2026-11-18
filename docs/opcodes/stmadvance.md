<!--
id:stmadvance
category:Instrument Control:State Machine Graphs
-->
# stmadvance

Applies the pending transition request of a runner and moves its clock.

Call it once per control period, after the code for the current node has run.

## Syntax

=== "Modern"
    ``` csound-orc
    kstatus, kfrom, kto = stmadvance(irunner)
    ```

=== "Classic"
    ``` csound-orc
    kstatus, kfrom, kto stmadvance irunner
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_kstatus_ -- the outcome of the advance:

| Status | Meaning |
| --- | --- |
| 0 | No request was pending. |
| 1 | The request was legal and the runner moved to another node. |
| 2 | The current node has no edge to the requested node. Nothing changed. |
| 3 | The request was a legal self edge: the runner stays on the same node, but the move counts as a transition. |
| 4 | Two different nodes were requested in the same control period. Neither is applied. |
| 5 | The runner is paused. |
| 6 | The runner is deleted. |

_kfrom_ -- the id of the current node before the advance.

_kto_ -- the id of the requested node. It is -1 when no single node was requested (status 0 and 4) and when the runner is paused or deleted.

The pending request is cleared whatever the outcome. A transition (status 1 or 3) restarts the node clock and is recorded in the event history, where [stmonenter](stmonenter.md), [stmonexit](stmonexit.md) and [stmevent](stmevent.md) see it.

Each call also adds one control period to the runner's clock, which is why it should be called once per control period. The period is that of the instrument or UDO that calls it. The clock does not move while the runner is paused or deleted, nor in the control period of an [stmreset](stmreset.md). Read the clock before `stmadvance`: after it, the clock shows the values of the next control period.

This opcode changes the runner, so it counts as a writer: a runner accepts writers from one instrument instance at a time. See [Writers and observers](../control/stm.md#writers-and-observers).

## Examples

### A scripted run showing every advance status

A scripted run of a small graph. It prints, for each control period, the current node and the graph clock as read before [stmadvance](stmadvance.md), the request made, and what `stmadvance` returned. Each control period lasts 10 ms. It uses the file [stm-trace.csd](../examples/stm-trace.csd).

``` csound-csd title="A scripted run showing every advance status." linenums="1"
--8<-- "examples/stm-trace.csd"
```

Its output is:

``` text
3 nodes, 5 edges: Play Idle Hold
cyc node   id  tick  time  nodetime  request       status from to
  1 Idle    1     0  0.00      0.00  -                 0    1 -1
  2 Idle    1     1  0.01      0.01  Play              1    1  0
  3 Play    0     2  0.02      0.00  Idle              2    0  1
  4 Play    0     3  0.03      0.01  Play              3    0  0
  5 Play    0     4  0.04      0.00  Hold+Idle         4    0 -1
  6 Play    0     5  0.05      0.01  id of Hold        1    0  2
  7 Hold    2     6  0.06      0.00  -                 0    2 -1
  8 Hold    2     7  0.07      0.01  reset             0    1 -1
  9 Idle    1     0  0.00      0.00  -                 0    1 -1
```

Cycle 3 asks for a move that has no edge (status 2), cycle 4 uses the self edge on Play (status 3), and cycle 5 asks for two different nodes (status 4). The node time restarts after every accepted move, including the self transition, but not after the rejected ones. The reset in cycle 8 returns to the entry node Idle, which is id 1, and the clock reads 0 again in cycle 9.

### A state machine that shapes a texture

A texture moves through three nodes, Calm, Build and Burst. Each node is a UDO that writes a shared struct and asks for the next node with [stmnext](stmnext.md) when its time is up. The runner is created inside the instrument, so it lasts as long as the note. It uses the file [stm.csd](../examples/stm.csd).

``` csound-csd title="A state machine that shapes a texture." linenums="1"
--8<-- "examples/stm.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmnext](stmnext.md), [stmcurrent](stmcurrent.md), [stmtick](stmtick.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
