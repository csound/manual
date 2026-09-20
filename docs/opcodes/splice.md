<!--
id:splice
category:Instrument Control:Initialization and Reinitialization
-->
# splice
Places an instrument instance before or after another in the performance list.

## Syntax

=== "Modern"
    ``` csound-orc
    iStatus = splice(voice, anchor, iMode)
    ```

=== "Classic"
    ``` csound-orc
    iStatus splice voice, anchor, iMode
    ```

### Initialization

`voice` is the `Instr` instance to place in the list. `anchor` is an `Instr` instance already in Csound's active performance list. Use distinct instances.

`iMode` selects the position. Use 0 to put `voice` immediately before `anchor`, or 1 to put it immediately after.

`iStatus` is 0 on success and -1 if Csound cannot place the instance. The operation runs once at initialization. It does not create or initialize either instance.

One use is to insert an instance made with [create](create.md) and [init](init.md) so that it runs before an instrument that reads its audio bus. Once inserted, Csound performs it automatically. Do not also call [perf](perf.md) on it.

## Examples

The controller creates a source and inserts it immediately before itself. The source writes to `gaBus` before the controller reads the bus and applies an envelope. It uses [splice.csd](../examples/splice.csd).

``` csound-csd title="Run a source before its bus reader" linenums="1"
--8<-- "examples/splice.csd"
```

## See also

[create](create.md), [init](init.md), [getinstance](getinstance.md), [delete](delete.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author Victor Lazzarini.

New in Csound 7.
