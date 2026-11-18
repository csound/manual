# **State Machine Graphs**

The STM opcodes build state machines as graphs of named nodes connected by directed edges. The graph decides which node is current and which moves are allowed; what a node does is ordinary orchestra code. The design is inspired by [LangGraph](https://github.com/langchain-ai/langgraph).

Use them for anything that moves through distinct stages: the sections of a piece, the phases of a gesture, the modes of an interactive patch, or a voice that switches between processes.

## Builder, definition and runner

A graph goes through three objects, each referred to by a numeric handle:

1. [stmcreate](../opcodes/stmcreate.md) returns a **builder**. Add nodes with [stmaddnode](../opcodes/stmaddnode.md), edges with [stmaddedge](../opcodes/stmaddedge.md) or [stmaddcondedge](../opcodes/stmaddcondedge.md), and optionally choose the entry node with [stmentry](../opcodes/stmentry.md).
2. [stmcompile](../opcodes/stmcompile.md) freezes the builder into an immutable **definition**. After that the builder cannot be changed.
3. [stminstance](../opcodes/stminstance.md) creates a **runner** from a definition. The runner holds everything that changes during performance: the current node, the pending request, the clock and the event history. One definition can back any number of runners, each fully independent.

All three are i-time opcodes. Every other STM opcode takes a runner handle.

``` csound-orc
builder:i = stmcreate()
stmaddnode(builder, "Calm")
stmaddnode(builder, "Build")
stmaddnode(builder, "Burst")
stmaddedge(builder, "Calm", "Build")
stmaddedge(builder, "Build", "Burst")
stmaddcondedge(builder, "Burst", ["Calm", "Build"])
gi_definition@global:i = stmcompile(builder)
```

### Lifetime of the handles

A builder, definition or runner belongs to the opcode instance that created it, and its handle is removed when that instance ends. Created in the global space, outside any instrument, it lasts for the whole performance. Created in an instrument, it lasts as long as that note.

Opcodes that already use a runner keep it alive after its handle is removed, and a runner keeps its definition alive in the same way. An opcode that is initialized with a removed handle reports an initialization error.

## The runtime loop

In each control period, the orchestra asks the runner for the current node, runs the code for that node, and then calls [stmadvance](../opcodes/stmadvance.md):

``` csound-orc
node:S = stmcurrent(r)
if strcmpk(node, "Calm") == 0 then
  CalmNode(r, state)
elseif strcmpk(node, "Build") == 0 then
  BuildNode(r, state)
else
  BurstNode(r, state)
endif
status:k, from:k, to:k = stmadvance(r)
```

A node asks for a move with [stmnext](../opcodes/stmnext.md). The request is not applied at once: `stmadvance` checks it against the edges of the current node, applies it if the edge exists, and reports the outcome. A common pattern is to write each node as a UDO that receives the runner handle and a shared `struct` by reference, so that nodes communicate through the struct and the sound is computed from it.

[stmcurrent](../opcodes/stmcurrent.md) gives the current node by name and [stmcurrentid](../opcodes/stmcurrentid.md) by id. Ids are numbers from 0, assigned in the order the nodes were added. [stmnodeid](../opcodes/stmnodeid.md), [stmnodename](../opcodes/stmnodename.md), [stmnodecount](../opcodes/stmnodecount.md) and [stmedgecount](../opcodes/stmedgecount.md) translate between names and ids and describe the graph.

### Advance status

`stmadvance` returns a status, the id of the node it started from and the id of the requested node:

| Status | Meaning |
| --- | --- |
| 0 | No request was pending. |
| 1 | The request was legal and the runner moved to another node. |
| 2 | The current node has no edge to the requested node. Nothing changed. |
| 3 | The request was a legal self edge: the runner stays on the same node, but the move counts as a transition. |
| 4 | Two different nodes were requested in the same control period. Neither is applied. |
| 5 | The runner is paused. |
| 6 | The runner is deleted. |

The target id is -1 when no single node was requested, and when the runner is paused or deleted.

Requests share one pending slot. Repeating the same request is harmless. Requesting a different node before `stmadvance` makes the advance report a conflict (status 4) and apply neither request.

## Watching transitions

[stmonenter](../opcodes/stmonenter.md) and [stmonexit](../opcodes/stmonexit.md) output 1 when a named node has just been entered or left. They are meant for starting and stopping processes when the graph moves, for example scheduling an instrument when a node is entered and releasing it when the node is left. They only see the most recent transition, so they should run in every control period, ideally in the same instrument that advances the graph.

[stmevent](../opcodes/stmevent.md) reads the runner's event history in order: transitions, resets, recalls, pauses, resumes and deletion. The runner keeps the last 10 events, and each `stmevent` reports when it has missed some.

## The graph clock

Each runner has its own clock, read with [stmtick](../opcodes/stmtick.md), [stmtime](../opcodes/stmtime.md) and [stmnodetime](../opcodes/stmnodetime.md). The clock is moved by `stmadvance`, one control period per call, so it only runs while the machine is being stepped. It stops while the runner is paused, and it does not follow performance time when the driving instrument is not running.

Two rules follow:

* Call `stmadvance` once per control period for each runner.
* Read the clock before `stmadvance`. After it, the clock already shows the values for the next control period.

The clock counts in integers, so it does not drift over long performances. Each advance adds the length of the control period of the instrument or UDO that calls it, including local `setksmps`, `oversample` and `undersample` settings.

## Controlling a runner

* [stmreset](../opcodes/stmreset.md) returns the runner to its entry node and restarts its clock.
* [stmpause](../opcodes/stmpause.md) and [stmresume](../opcodes/stmresume.md) freeze and release the runner. While it is paused, requests are ignored and the clock stops.
* [stmdelete](../opcodes/stmdelete.md) stops the runner for good.
* [stmcall](../opcodes/stmcall.md) saves the state of the runner under a name, and [stmrecall](../opcodes/stmrecall.md) restores it. A name works as a save slot: saving it again replaces the previous state.

All six take a trigger and act when it becomes positive. Holding the trigger high does not repeat the action.

## Writers and observers

Opcodes that change a runner are writers: `stmnext`, `stmadvance`, `stmreset`, `stmpause`, `stmresume`, `stmdelete`, `stmcall` and `stmrecall`. A runner accepts writers from one instrument instance at a time, including the UDOs it calls. If another instance tries to initialize a writer while the first is active, it gets an initialization error. When the first instance ends, another can take over.

All other runtime opcodes are observers. Any number of instruments can observe a runner at the same time, including with the multicore engine.

## Opcodes

Building the graph:

* [stmcreate](../opcodes/stmcreate.md)
* [stmaddnode](../opcodes/stmaddnode.md)
* [stmaddedge](../opcodes/stmaddedge.md)
* [stmaddcondedge](../opcodes/stmaddcondedge.md)
* [stmentry](../opcodes/stmentry.md)
* [stmcompile](../opcodes/stmcompile.md)
* [stminstance](../opcodes/stminstance.md)

Running:

* [stmcurrent](../opcodes/stmcurrent.md)
* [stmcurrentid](../opcodes/stmcurrentid.md)
* [stmnext](../opcodes/stmnext.md)
* [stmadvance](../opcodes/stmadvance.md)

Introspection:

* [stmnodeid](../opcodes/stmnodeid.md)
* [stmnodename](../opcodes/stmnodename.md)
* [stmnodecount](../opcodes/stmnodecount.md)
* [stmedgecount](../opcodes/stmedgecount.md)

Events:

* [stmonenter](../opcodes/stmonenter.md)
* [stmonexit](../opcodes/stmonexit.md)
* [stmevent](../opcodes/stmevent.md)

Clock:

* [stmtick](../opcodes/stmtick.md)
* [stmtime](../opcodes/stmtime.md)
* [stmnodetime](../opcodes/stmnodetime.md)

Control:

* [stmreset](../opcodes/stmreset.md)
* [stmpause](../opcodes/stmpause.md)
* [stmresume](../opcodes/stmresume.md)
* [stmdelete](../opcodes/stmdelete.md)
* [stmcall](../opcodes/stmcall.md)
* [stmrecall](../opcodes/stmrecall.md)

## Examples

* [stm.csd](../examples/stm.csd): the runtime loop, with one UDO per node and a shared struct.
* [stm-trace.csd](../examples/stm-trace.csd): every advance status, ids, the clock and a reset.
* [stm-events.csd](../examples/stm-events.csd): enter/exit triggers and the event history, with pause, resume and delete.
* [stm-checkpoint.csd](../examples/stm-checkpoint.csd): saving and restoring the state of a runner.
* [stm-processes.csd](../examples/stm-processes.csd): nodes bound to instruments, and two runners sharing one definition.
