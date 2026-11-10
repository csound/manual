<!--
id:stmcall
category:Instrument Control:State Machine Graphs
-->
# stmcall

Saves the state of a runner under a name.

The saved state can be restored later with [stmrecall](stmrecall.md).

## Syntax

=== "Modern"
    ``` csound-orc
    kdone = stmcall(irunner, Sname, ktrig)
    ```

=== "Classic"
    ``` csound-orc
    kdone stmcall irunner, Sname, ktrig
    ```

### Initialization

_irunner_ -- a runner handle, returned by [stminstance](stminstance.md).

### Performance

_Sname_ -- the name of the saved state, from 1 to 63 characters. A name works as a save slot: saving under a name that already exists in the runner replaces that state.

_ktrig_ -- the action happens when _ktrig_ becomes greater than 0, that is on the first pass where it is positive after being 0 or less. A trigger that is positive on the very first pass also counts. Holding _ktrig_ high does not repeat the action.

_kdone_ -- 1 on the pass where the state is saved, 0 otherwise.

The saved state is the current node, the previous node, the pending request and the clock (tick count, graph time and node time). The event history and the paused state are not saved. Saving also works while the runner is paused.

A runner keeps up to 100 names. When it is full, saving under a new name replaces the oldest one. On a deleted runner, `stmcall` does nothing and outputs 0.

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

[stmrecall](stmrecall.md), [stmreset](stmreset.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
