<!--
id:play
category:Instrument Control:Invocation
-->
# play
Starts an instrument immediately and returns its instance.

## Syntax

=== "Modern"
    ``` csound-orc
    voice:Instr = play(definition[, ip4, ip5, ...])
    ```

=== "Classic"
    ``` csound-orc
    voice:Instr play definition[, ip4, ip5, ...]
    ```

### Initialization

`definition` is an `InstrDef`, such as a named instrument or a definition returned by [create](create.md). The optional numeric arguments supply p4, p5 and the following p-fields.

`voice` refers to the new instance. `play` creates and initializes it during the caller's initialization, with p2 set to 0 and p3 set to -1. There is no start-time or duration argument.

Csound adds the instance to the end of its performance list, regardless of its instrument number. The returned reference is ready for use when `play` returns. Csound performs the instance automatically, so do not also call `perf` on it.

Use [setp](setp.md) to change its p-fields, [pause](pause.md) to pause and resume it, or [turnoff](turnoff.md) to stop it. Arrange [delete](delete.md) in the owning instrument for cleanup when that instrument ends. Use [schedule](schedule.md) when a note needs a start time and duration.

## Examples

The controller starts a tone, pauses it for half a second and resumes it at a higher pitch. Its `delete` call cleans up the voice when the controller ends. It uses [instance-controls.csd](../examples/instance-controls.csd).

``` csound-csd title="Pause a voice and change its pitch" linenums="1"
--8<-- "examples/instance-controls.csd"
```

## See also

[create](create.md), [schedule](schedule.md), [pause](pause.md), [setp](setp.md), [turnoff](turnoff.md), [delete](delete.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author Victor Lazzarini.

New in Csound 7.
