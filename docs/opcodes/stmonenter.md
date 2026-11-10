<!--
id:stmonenter
category:Instrument Control:State Machine Graphs
-->
# stmonenter

Outputs 1 when a node of a runner has just been entered.

Use it to start a process when the graph moves into a node, for example by scheduling an instrument.

## Syntax

=== "Modern"
    ``` csound-orc
    ktrig = stmonenter(irunner, Snode)
    ```

=== "Classic"
    ``` csound-orc
    ktrig stmonenter irunner, Snode
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

_Snode_ -- the name of the node to watch. An unknown name causes an initialization error.

### Performance

_ktrig_ -- 1 on the first pass after a transition into _Snode_, 0 otherwise.

A transition is a move accepted by [stmadvance](stmadvance.md) (status 1 or 3), or an [stmreset](stmreset.md) or [stmrecall](stmrecall.md) that changes the current node. A self transition fires both the enter and the exit trigger of its node. Pause, resume and delete are not transitions.

The node that is current when the runner is created is not an event, so nothing fires for it. Each opcode instance only reacts to transitions that happen after it was initialized: an observer that starts while a node is already current does not see an enter for it.

The opcode compares the latest transition with the one it saw on its previous pass. If the runner made several transitions in between, only the last one is seen. Call it in every control period, ideally in the instrument that advances the graph, or use [stmevent](stmevent.md) to read every event.

This opcode only reads the runner. Any number of instruments can use it at the same time.

## Examples

### Nodes bound to instruments

Each node starts an instrument when it is entered and releases it when it is left. One definition backs two runners, one per voice, each with its own current node and clock. It uses the file [stm-processes.csd](../examples/stm-processes.csd).

``` csound-csd title="Nodes bound to instruments." linenums="1"
--8<-- "examples/stm-processes.csd"
```

### Watching transitions and events

One instrument drives a runner through transitions, a pause, a resume and a deletion. A second instrument watches it with [stmonenter](stmonenter.md), [stmonexit](stmonexit.md) and [stmevent](stmevent.md). It uses the file [stm-events.csd](../examples/stm-events.csd).

``` csound-csd title="Watching transitions and events." linenums="1"
--8<-- "examples/stm-events.csd"
```

Its output is:

``` text
cycle 1: advance status 1
  enter B 1, exit B 0
  event 1: kind 1, 0 -> 1, overflow 0
cycle 2: advance status 3
  enter B 1, exit B 1
  event 2: kind 2, 1 -> 1, overflow 0
cycle 3: advance status 5
  event 3: kind 5, 1 -> 1, overflow 0
cycle 4: advance status 5
cycle 5: advance status 0
  event 4: kind 6, 1 -> 1, overflow 0
cycle 6: advance status 1
  enter B 0, exit B 1
  event 5: kind 1, 1 -> 0, overflow 0
cycle 7: advance status 6
  event 6: kind 7, 0 -> 0, overflow 0
cycle 8: advance status 6
cycle 9: advance status 6
```

Event kinds: 1 transition, 2 self transition, 5 pause, 6 resume, 7 delete. The self transition in cycle 2 fires both the enter and the exit trigger of B. The request in cycle 4 is ignored because the runner is paused, and the one in cycle 8 because it is deleted. Pause, resume and delete appear as events but do not fire the enter and exit triggers.

## See also

[State Machine Graphs](../control/stm.md)

[stmonexit](stmonexit.md), [stmevent](stmevent.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
