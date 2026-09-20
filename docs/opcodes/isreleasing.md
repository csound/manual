<!--
id:isreleasing
category:Instrument Control:Realtime Performance Control
-->
# isreleasing
Reports whether an instrument instance is in its release stage.

## Syntax

=== "Modern"
    ``` csound-orc
    releasing:b = isreleasing(voice)
    releasing:B = isreleasing(voice)
    releasing:B = isreleasing()
    kReleasing = isreleasing()
    ```

=== "Classic"
    ``` csound-orc
    releasing:b isreleasing voice
    releasing:B isreleasing voice
    ```

### Initialization and performance

`voice` is an `Instr` reference to an initialized instance. With this argument, a `b` output checks once at initialization and a `B` output checks on every control cycle. The result is true while that instance is releasing and false otherwise.

Use function-call syntax for the forms without an argument. They check the current instrument on every control cycle. A `B` output is boolean. A `k` output is 1 during release and 0 otherwise, as with [release](release.md).

A release tail lets an instrument continue after its note-off. Use an envelope such as [linsegr](linsegr.md), or [xtratim](xtratim.md), to set the release length. The forms without an argument request a short release extension if the instrument has none, just as `release` does. Checking another instance does not extend that instance's duration.

This opcode requires a valid instance when you supply `voice`. It cannot check the validity of an uninitialized or deleted reference. It also does not report whether a note has already ended.

## Examples

The note lasts 0.5 seconds, followed by a 0.2-second envelope release. The printed value changes from 0 to 1 when that release starts. It uses [isreleasing.csd](../examples/isreleasing.csd).

``` csound-csd title="Detect a note release" linenums="1"
--8<-- "examples/isreleasing.csd"
```

## See also

[isactive](isactive.md), [getinstance](getinstance.md), [release](release.md), [linsegr](linsegr.md), [xtratim](xtratim.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author Victor Lazzarini.

New in Csound 7.
