<!--
id:stmevent
category:Instrument Control:State Machine Graphs
-->
# stmevent

Reads the event history of a runner, one event per call.

Unlike [stmonenter](stmonenter.md) and [stmonexit](stmonexit.md), which only see the latest transition, `stmevent` returns every event in order and reports when some were lost.

## Syntax

=== "Modern"
    ``` csound-orc
    kkind, kseq, koverflow, kavailable, kfrom, kto = stmevent(irunner)
    ```

=== "Classic"
    ``` csound-orc
    kkind, kseq, koverflow, kavailable, kfrom, kto stmevent irunner
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_kavailable_ -- 1 if an unread event was returned, 0 if there was none. When it is 0, _kkind_, _kseq_, _kfrom_ and _kto_ keep their previous values.

_kkind_ -- the kind of event:

| Kind | Event |
| --- | --- |
| 1 | Transition to another node |
| 2 | Self transition |
| 3 | Reset to the entry node |
| 4 | Recall of a saved state |
| 5 | Pause |
| 6 | Resume |
| 7 | Delete |

_kseq_ -- the sequence number of the event. The first event of a runner is 1, and each following event adds 1.

_kfrom_, _kto_ -- the ids of the node before and after the event. For pause, resume and delete they are both the current node.

_koverflow_ -- 1 if events were lost before this one, 0 otherwise.

Each opcode instance has its own read position, so several observers can read the same history independently. Reading starts with the first event after the opcode was initialized. Each call returns one event, so read in a loop to get all the events of a control period, as in the example below.

A runner keeps its last 10 events. If more than 10 happen between two reads, the oldest are lost: the next call sets _koverflow_ to 1 and continues from the oldest event still kept.

This opcode only reads the runner. Any number of instruments can use it at the same time.

## Examples

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

[stmonenter](stmonenter.md), [stmonexit](stmonexit.md), [stmadvance](stmadvance.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
