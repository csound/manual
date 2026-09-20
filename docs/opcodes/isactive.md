<!--
id:isactive
category:Instrument Control:Realtime Performance Control
-->
# isactive
Reports whether an instrument instance is active.

## Syntax

=== "Modern"
    ``` csound-orc
    active:b = isactive(voice)
    active:B = isactive(voice)
    ```

=== "Classic"
    ``` csound-orc
    active:b isactive voice
    active:B isactive voice
    ```

### Initialization and performance

`voice` is an `Instr` reference to an initialized instance.

The `b` output checks the state once at initialization. The `B` output checks it on every control cycle. Both return a boolean that you can use in an `if` statement.

An active instance returns true. Pausing it makes this result false. A note can remain active during its release tail, so use [isreleasing](isreleasing.md) to check for that stage.

`isactive` reads the state of an existing instance. It cannot tell whether an uninitialized or deleted reference is safe to use. In particular, do not query a reference returned by `schedule` before the scheduled note has started.

## Examples

The example prints 1 while the voice runs, 0 while it is paused, then 1 when it resumes. The `if` statement converts the boolean to a number for `printk2`. It uses [instance-controls.csd](../examples/instance-controls.csd).

``` csound-csd title="Read the active state of a voice" linenums="1"
--8<-- "examples/instance-controls.csd"
```

## See also

[getinstance](getinstance.md), [isreleasing](isreleasing.md), [pause](pause.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author Victor Lazzarini.

New in Csound 7.
