<!--
id:getinstance
category:Instrument Control:Initialization and Reinitialization
-->
# getinstance
Returns a reference to the current instrument instance.

## Syntax

=== "Modern"
    ``` csound-orc
    self:Instr = getinstance()
    ```

=== "Classic"
    ``` csound-orc
    self:Instr getinstance
    ```

### Initialization

`self` refers to the instrument instance containing the call. No new instance is created. Within an instrument, the built-in read-only variable `this` refers to the same instance.

Use the reference with operations such as [isactive](isactive.md), [isreleasing](isreleasing.md) or [splice](splice.md). It refers to this particular note, even if other notes use the same instrument definition.

The reference does not extend the note's lifetime. Keep its use within that lifetime, and let Csound manage the current note's cleanup. For the instrument definition, use the built-in read-only variable `this_instr`, which has type `InstrDef`.

## Examples

The controller obtains its own reference with `getinstance` and checks its state before starting performance. It uses [instance-controls.csd](../examples/instance-controls.csd).

``` csound-csd title="Get the controller instance" linenums="1"
--8<-- "examples/instance-controls.csd"
```

## See also

[isactive](isactive.md), [isreleasing](isreleasing.md), [splice](splice.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author Victor Lazzarini.

New in Csound 7.
