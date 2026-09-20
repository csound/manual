<!--
id:delete
category:Instrument Control:Initialization and Reinitialization
-->
# delete
Cleans up an object when the containing instrument ends.

`delete` runs during deinitialization. It has no output and does not run at initialization or on each control cycle. Deinitialization follows the containing instrument's end, including any release extension.

For an introduction to the object types and their use, see [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md).

## Syntax

=== "Modern"
    ``` csound-orc
    delete(instance)
    delete(definition)
    delete(opcode)
    delete(opcodes)
    delete(engine)
    ```

=== "Classic"
    ``` csound-orc
    delete instance
    delete definition
    delete opcode
    delete opcodes
    delete engine
    ```

### Deinitialization

Each call takes one object. Its type selects the operation.

| Argument | Type | Effect |
| --- | --- | --- |
| `instance` | `Instr` | Stops the instance and releases it where possible. Csound may keep scheduler-managed instance memory for reuse. The supplied reference is cleared. |
| `definition` | `InstrDef` | Removes the compiled instrument definition and its inactive instances. Remove it only after all its instances have finished. Csound rejects removal if it finds instances still in use. |
| `opcode` | `Opcode` | Runs the opcode object's cleanup and releases its allocated state. |
| `opcodes` | `Opcode[]` | Cleans up each object in a one-dimensional opcode array. |
| `engine` | `Csound` | Destroys the separate Csound engine and frees its audio buffers. |

Place `delete` alongside the code that creates the object, and keep that object available until cleanup. It uses the object held by its argument at deinitialization. Assigning a different object to the same variable before then changes what gets deleted.

Several variables may refer to the same object. Arrange one cleanup for that object and stop using all its references after deletion. An `InstrDef` must remain available until every note that uses it has finished, including any release tail or pending scheduled event.

A performance-time condition does not make `delete` run immediately. To stop an `Instr` during performance, use [turnoff](turnoff.md). `remove(definition)` attempts to remove an `InstrDef` at initialization and still requires its instances to have finished. `destroy(engine)` destroys a `Csound` object at initialization. Do not also arrange a later `delete` for an object you destroy immediately.

## Examples

This example compiles an instrument definition and schedules two short notes. The containing instrument lasts 1.2 seconds, so both notes have finished when `delete` removes the definition. It uses [delete.csd](../examples/delete.csd).

``` csound-csd title="Remove a temporary definition after its notes finish" linenums="1"
--8<-- "examples/delete.csd"
```

The [object guide](../orch/instrument-and-opcode-objects.md) also has examples using `delete` with an `Instr`, an `Opcode` and an `Opcode[]`.

## See also

[create](create.md), [init](init.md), [perf](perf.md), [turnoff](turnoff.md), [remove](remove.md)

## Credits

Csound 7 instrument and opcode object support by Victor Lazzarini.

New in Csound 7.
