<!--
id:endin
category:Orchestra Syntax:Block Statements
-->
# endin
Ends the current instrument block.

## Syntax
``` csound-orc
endin
```

### Initialization

Instruments can be defined in any order (but they will always be both initialized and performed in ascending instrument number order). Instrument blocks cannot be nested (i.e. one block cannot contain another).

> :memo: **Note**
>
> There may be any number of instrument blocks in an orchestra.

## Examples

Here is an example of the endin opcode. It uses the file [endin.csd](../examples/endin.csd).

``` csound-csd title="Example of the endin opcode." linenums="1"
--8<-- "examples/endin.csd"
```

## See also

[Instrument Statements](../orch/instruments.md)

## Credits

Example written by Kevin Conder.
