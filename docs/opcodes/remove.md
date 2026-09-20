<!--
id:remove
category:Instrument Control:Invocation
-->
# remove
Removes the definition of an instrument as long as it is not in use.

## Syntax
=== "Modern"
    ``` csound-orc
    remove(insnum)
    remove(definition)
    ```

=== "Classic"
    ``` csound-orc
    remove insnum
    remove definition
    ```

### Initialization

_insnum_ -- number or name of the instrument to be deleted

`definition` is an `InstrDef`. This form is available in Csound 7.

`remove` runs at initialization. It removes the compiled definition and its inactive instances. Remove it only after all its instances have finished. Csound rejects removal if it finds instances still in use.

Wait until every note that uses the definition has finished, and cancel any pending events that would use it. Do not use references to a removed definition or its instances afterward. For cleanup when the containing instrument ends, use [delete](delete.md).

## See also

[delete](delete.md), [create](create.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
June, 2006<br>

New in Csound version 5.04
