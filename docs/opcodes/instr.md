<!--
id:instr
category:Orchestra Syntax:Block Statements
-->
# instr
Starts an instrument block.

## Syntax
``` csound-orc
instr i, j, ...
```

### Initialization

Starts an instrument block defining instruments _i, j_, ...

_i, j_, ... must be numbers or names, not expressions. Any positive integer is legal, and in any order, but excessively high numbers are best avoided.

> :memo: **Note**
>
> There may be any number of instrument blocks in an orchestra.

Instruments can be defined in any order (but they will always be both initialized and performed in ascending instrument number order, with the exception of notes triggered by real time events that are initialized in the order of being received but still performed in ascending instrument number order).  Instrument blocks cannot be nested (i.e. one block cannot contain another).

For more information on named instruments, see [Named Instruments](../orch/instruments.md#named-instruments).

## Examples

Here is an example of the instr opcode. It uses the file [instr.csd](../examples/instr.csd).

``` csound-csd title="Example of the instr opcode." linenums="1"
--8<-- "examples/instr.csd"
```

## See also

[Instrument Statements](../orch/instruments.md)

## Credits

Example written by Kevin Conder.
