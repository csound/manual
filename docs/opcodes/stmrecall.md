<!--
id:stmrecall
category:Instrument Control:State Machine Graphs
-->
# stmrecall

Restores a saved state of a runner.

The state must have been saved with [stmcall](stmcall.md).

## Syntax

=== "Modern"
    ``` csound-orc
    kdone = stmrecall(irunner, Sname, ktrig)
    ```

=== "Classic"
    ``` csound-orc
    kdone stmrecall irunner, Sname, ktrig
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_Sname_ -- the name of a saved state. An unknown name causes a performance error.

_ktrig_ -- the action happens when _ktrig_ becomes greater than 0, that is on the first pass where it is positive after being 0 or less. A trigger that is positive on the very first pass also counts. Holding _ktrig_ high does not repeat the action.

_kdone_ -- 1 on the pass where the state is restored, 0 otherwise.

Recalling restores the current node, the previous node, the pending request and the clock. It is recorded as an event (kind 4). If it changes the current node, it also counts as a transition for [stmonenter](stmonenter.md) and [stmonexit](stmonexit.md); a recall that lands on the current node does not fire them. The event history, the saved states and the paused state are not changed.

`stmrecall` is ignored while the runner is paused or deleted.

This opcode changes the runner, so it counts as a writer: a runner accepts writers from one instrument instance at a time. See [Writers and observers](../control/stm.md#writers-and-observers).

## Examples

A runner walks a chain of sections, one per control period. Its state at Verse is saved with [stmcall](stmcall.md) and restored twice with [stmrecall](stmrecall.md), so the walk from Verse is repeated with the same node and the same clock. It uses the file [stm-checkpoint.csd](../examples/stm-checkpoint.csd).

``` csound-csd title="Saving and restoring the state of a runner." linenums="1"
--8<-- "examples/stm-checkpoint.csd"
```

Its output is:

``` text
cycle  1  tick 0  Intro   saved 0  restored 0  -> Verse
cycle  2  tick 1  Verse   saved 1  restored 0  -> Chorus
cycle  3  tick 2  Chorus  saved 0  restored 0  -> Outro
cycle  4  tick 3  Outro   saved 0  restored 1  -> Verse
cycle  5  tick 1  Verse   saved 1  restored 0  -> Chorus
cycle  6  tick 2  Chorus  saved 0  restored 0  -> Outro
cycle  7  tick 3  Outro   saved 0  restored 1  -> Verse
cycle  8  tick 1  Verse   saved 1  restored 0  -> Chorus
cycle  9  tick 2  Chorus  saved 0  restored 0  -> Outro
cycle 10  tick 3  Outro   saved 0  restored 0  -> Outro
```

The trigger of `stmcall` rises on every pass through Verse, so "verse" is saved again in cycles 5 and 8; each save replaces the previous one, here with the same state. Each recall restores the node and the tick count, so the walk from Verse repeats exactly.

## See also

[State Machine Graphs](../control/stm.md)

[stmcall](stmcall.md), [stmreset](stmreset.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
