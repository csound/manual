<!--
id:stminstance
category:Instrument Control:State Machine Graphs
-->
# stminstance

Creates a runner from a graph definition.

The runner is the part of a state machine that changes during performance: it holds the current node, the pending request, the clock and the event history. Every runner is independent, even when several are created from the same definition.

## Syntax

=== "Modern"
    ``` csound-orc
    irunner = stminstance(idef)
    ```

=== "Classic"
    ``` csound-orc
    irunner stminstance idef
    ```

### Initialization

_idef_ -- a definition handle, returned by [stmcompile](stmcompile.md).

_irunner_ -- the handle of the new runner. It starts on the entry node, with its clock at 0 and no events.

The runner belongs to the opcode instance that created it, and its handle is removed when that instance ends. Created in an instrument, a runner lasts as long as the note; created in the global space, it lasts for the whole performance. Opcodes that were initialized with the handle keep the runner alive until they end, while an opcode initialized after the handle was removed reports an initialization error.

Handles are plain numbers, so they can be passed to other instruments, for example as p-fields or global variables.

## Examples

### A state machine that shapes a texture

A texture moves through three nodes, Calm, Build and Burst. Each node is a UDO that writes a shared struct and asks for the next node with [stmnext](stmnext.md) when its time is up. The runner is created inside the instrument, so it lasts as long as the note. It uses the file [stm.csd](../examples/stm.csd).

``` csound-csd title="A state machine that shapes a texture." linenums="1"
--8<-- "examples/stm.csd"
```

### Nodes bound to instruments

Each node starts an instrument when it is entered and releases it when it is left. One definition backs two runners, one per voice, each with its own current node and clock. It uses the file [stm-processes.csd](../examples/stm-processes.csd).

``` csound-csd title="Nodes bound to instruments." linenums="1"
--8<-- "examples/stm-processes.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmcompile](stmcompile.md), [stmcurrent](stmcurrent.md), [stmadvance](stmadvance.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
