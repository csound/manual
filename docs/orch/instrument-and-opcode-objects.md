# Instrument definitions, instances and opcode objects

Csound 7 lets you store an instrument definition, an instrument instance or an opcode object in a variable. You can pass these variables to other opcodes and user-defined opcodes.

| Type | What it refers to | Example |
| --- | --- | --- |
| `InstrDef` | A compiled instrument definition | The named instrument `Tone` |
| `Instr` | One instance of an instrument, with its own variables and state | One note played by `Tone` |
| `OpcodeDef` | An opcode definition, including its overloads | The opcode name `oscili` |
| `Opcode` | One opcode instance, with its own state | One oscillator's phase state |

A definition can produce many instances. Each instance keeps its own state. Assigning a reference to another variable refers to the same object rather than creating a new instance.

## Instrument definitions

A named instrument creates an `InstrDef` constant with the same name. Use that name directly when scheduling it, without quotes.

``` csound-orc
instr Tone
  aTone poscil 0.1, p4
  out aTone
endin

schedule(Tone, 0, 1, 440)
schedule(Tone, 1.2, 1, 660)
```

Here `Tone` identifies the definition. The two scheduled notes are separate instances. Within an instrument, `this_instr` refers to its definition and `this` refers to its current instance. Both are read-only.

You can also compile an instrument body with [create](../opcodes/create.md). The result is an `InstrDef`, and Csound assigns its instrument number. Pass the body without `instr` and `endin`.

The following example creates a definition, schedules two notes, and removes the definition when its containing instrument ends. Both notes finish first. It uses [delete.csd](../examples/delete.csd).

``` csound-csd title="Create and use an instrument definition" linenums="1"
--8<-- "examples/delete.csd"
```

Keep a definition available until its queued events and all active or releasing instances have finished. Delete any manually owned instances before their definition.

## Instrument instances

An `Instr` refers to one instance, so you can control that instance without affecting other notes from the same definition.

[schedule](../opcodes/schedule.md) starts a note at the requested time and performs it for the requested duration. Its `Instr` output becomes available when the note initializes. Keep that output variable alive until the start time, and do not query or control the instance before then.

[play](../opcodes/play.md) creates and initializes an instance immediately, returning an `Instr` that you can use at once. It has no duration argument. Arrange its cleanup in the instrument that owns it.

With `create`, you take control of initialization and performance. `create(Tone)` allocates an instance but does not schedule it. Call [init](../opcodes/init.md) once to initialize it and [perf](../opcodes/perf.md) to run one control block at a time.

| Operation | Timing and purpose |
| --- | --- |
| `voice:Instr = schedule(Tone, 0, 1, 440)` | Schedule a one-second note at initialization and keep its reference |
| `voice:Instr = play(Tone, 440)` | Start an indefinite note at initialization |
| `voice:Instr = create(Tone)` | Allocate an instance at initialization for manual performance |
| `iStatus = init(voice, 440)` | Initialize that instance, passing 440 as p4 |
| `kStatus = perf(voice)` | Perform one control block each time this call runs |
| `setp(voice, 4, kFrequency)` | Set p4 during performance |
| `pause(voice, kPause)` | Pause the instance when `kPause` is nonzero and resume it when zero |
| `turnoff(voice, kStop)` | Request turn-off with a trigger of 1, allowing any release tail |
| `delete(voice)` | Clean up the instance when the containing instrument ends |

Choose scheduling or manual performance for a given instance. Calling `perf` on an instance that Csound already performs through scheduling would run it again.

This example creates a `Tone` instance and performs it inside instrument 1. The parent supplies an amplitude envelope and a changing frequency through p4 and p5. It uses [instr-object.csd](../examples/instr-object.csd).

``` csound-csd title="Initialize and perform an instrument instance" linenums="1"
--8<-- "examples/instr-object.csd"
```

The manual instance has p3 set to -1. The parent controls its lifetime. The `init` and `perf` calls return zero on success. Arguments after the instance are p4, p5 and so on. Values passed to `init` are available during initialization, while values passed to `perf` update the p-fields for that performance block.

## Controlling a voice

An `Instr` lets a controller change one voice. [pause](../opcodes/pause.md) suspends its performance code while keeping its state. It does not move a scheduled note's end time. [setp](../opcodes/setp.md) changes a p-field for code that reads that field during performance.

This example starts a voice with `play`, pauses it for half a second and resumes it at a higher pitch. The controller owns the voice and deletes it when its own note ends. It uses [instance-controls.csd](../examples/instance-controls.csd).

``` csound-csd title="Pause and control one voice" linenums="1"
--8<-- "examples/instance-controls.csd"
```

[getinstance](../opcodes/getinstance.md) returns the current instance, as does the built-in variable `this`. This is useful when passing the current note to another opcode. It does not create another instance or extend the note's lifetime.

[isactive](../opcodes/isactive.md) checks whether an instance is active. A paused voice returns false, but a note with a release tail can remain active until that tail ends. Use [isreleasing](../opcodes/isreleasing.md) to check for the release stage. Both queries have a `b` form for initialization and a `B` form for performance. They require an initialized, available instance and cannot check whether an arbitrary reference is valid.

[turnoff](../opcodes/turnoff.md) requests the end of a note and allows its release extension. It does not delete the instrument definition.

### Performance order

[splice](../opcodes/splice.md) places an instance before or after another in Csound's active performance list. For example, a source can write a global audio bus before the next instrument reads it. Create and initialize the source first, then insert it relative to `this`. The `splice` page has a complete example.

Once an instance is in this list, Csound performs it automatically. Stop calling `perf` on it yourself.

### Instrument names

[instrnum](../opcodes/instrnum.md), also called [nstrnum](../opcodes/nstrnum.md), gets the number of an `InstrDef`. [str](../opcodes/str.md) gets a named definition's name. To look up a name from a number, use [instrstr](../opcodes/instrstr.md) or [nstrstr](../opcodes/nstrstr.md). You can pass an `InstrDef` straight to scheduling opcodes without converting it first.

## Opcode objects

An opcode name such as `oscili` is an `OpcodeDef`. Pass it to `create` to get an `Opcode` object. Creating two objects gives two independent sets of opcode state.

Use `run` to initialize an object and call its performance routine each control cycle. Its inputs and outputs must match the chosen opcode overload. For separate control of these phases, use `init` and `perf` instead.

``` csound-orc
oscillator:Opcode = create(oscili)
aTone = run(oscillator, 0.1, 440)
delete(oscillator)
```

The optional final argument to `create` selects an overload by its zero-based index. The default is 0. Use [opcodeinfo](../opcodes/opcodeinfo.md) on the `OpcodeDef` to inspect the available signatures before choosing an overload.

An `Opcode[]` holds several objects. `create(oscili, 3)` creates a one-dimensional array of three oscillators. With `run`, a scalar input supplies the same value to every object, while an array input supplies one value per object. Size each input array to match the number of objects.

This example first plays one oscillator, then a chord from three oscillator objects. Each oscillator keeps its own phase. It uses [opcode-object.csd](../examples/opcode-object.csd).

``` csound-csd title="Use one opcode object and an array of objects" linenums="1"
--8<-- "examples/opcode-object.csd"
```

## Object lifetimes

[delete](../opcodes/delete.md) runs at deinitialization, when the containing instrument ends, including any release extension. It does not run when execution reaches its line during initialization or performance.

Keep one clear owner for each object and arrange its cleanup there. Copying a reference shares the same object, so deleting through one reference makes the other references unusable. Do not delete each copy separately. Keep the object variable valid until cleanup and avoid replacing it with a different object before its `delete` runs.

Delete manually managed instances before deleting a definition they use. A shared named instrument definition normally stays available for the whole piece. For a temporary definition, let all its notes finish before removing it, as in the first example.

`delete` also accepts a `Csound` object, which holds a separate Csound engine. The [delete reference](../opcodes/delete.md) covers that form and the immediate `remove` and `destroy` operations.

Use [setoption](../opcodes/setoption.md) to configure an embedded engine before compiling code or starting it. Its example shows how the main engine can play audio from an embedded engine configured with `-n`.

## See also

[create](../opcodes/create.md), [play](../opcodes/play.md), [init](../opcodes/init.md), [perf](../opcodes/perf.md), [delete](../opcodes/delete.md), [opcodeinfo](../opcodes/opcodeinfo.md), [What's new in Csound 7](../intro/whats-new-in-csound-7.md)
