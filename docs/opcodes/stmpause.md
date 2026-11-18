<!--
id:stmpause
category:Instrument Control:State Machine Graphs
-->
# stmpause

Pauses a runner.

While a runner is paused, [stmadvance](stmadvance.md) returns status 5, its clock stops, and requests made with [stmnext](stmnext.md) are ignored. [stmresume](stmresume.md) releases it.

## Syntax

=== "Modern"
    ``` csound-orc
    stmpause(irunner, ktrig)
    ```

=== "Classic"
    ``` csound-orc
    stmpause irunner, ktrig
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_ktrig_ -- the action happens when _ktrig_ becomes greater than 0, that is on the first pass where it is positive after being 0 or less. A trigger that is positive on the very first pass also counts. Holding _ktrig_ high does not repeat the action.

Pausing clears the pending request and records a pause event (kind 5). Pausing a runner that is already paused or deleted has no effect. [stmrecall](stmrecall.md) is ignored while the runner is paused, while [stmreset](stmreset.md) still works.

This opcode changes the runner, so it counts as a writer: a runner accepts writers from one instrument instance at a time. See [Writers and observers](../control/stm.md#writers-and-observers).

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

[stmresume](stmresume.md), [stmdelete](stmdelete.md), [stmadvance](stmadvance.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
