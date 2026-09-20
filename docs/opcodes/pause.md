<!--
id:pause
category:Instrument Control:Realtime Performance Control
-->
# pause
Pauses or resumes an instrument instance.

## Syntax

=== "Modern"
    ``` csound-orc
    pause(voice, kPause)
    ```

=== "Classic"
    ``` csound-orc
    pause voice, kPause
    ```

### Performance

`voice` is an `Instr` reference to an initialized instance.

`kPause` controls the instance on every control cycle. Zero enables performance. Any other value pauses it. A paused instance keeps its variables and opcode state, and [isactive](isactive.md) reports false.

Pausing skips the instance's performance code. It does not shift a scheduled note's end time or restart its envelopes. Resume only an instance that you paused and that is still available. `pause` does not restart a note that has ended.

This also works with manually performed instances. While paused, a call to [perf](perf.md) skips the instance's performance code.

## Examples

The tone pauses at 0.5 seconds and resumes at 1 second. The controller continues to update its frequency during the pause. It uses [instance-controls.csd](../examples/instance-controls.csd).

``` csound-csd title="Pause and resume a tone" linenums="1"
--8<-- "examples/instance-controls.csd"
```

## See also

[play](play.md), [perf](perf.md), [isactive](isactive.md), [turnoff](turnoff.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author Victor Lazzarini.

New in Csound 7.
