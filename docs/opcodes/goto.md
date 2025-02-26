<!--
id:goto
category:Instrument Control:Program Flow Control
-->
# goto
Transfer control to _label_ on every pass. (Combination of [igoto](../../opcodes/igoto) and [kgoto](../../opcodes/kgoto))

## Syntax
``` csound-orc
goto label
```

where _label_ is in the same instrument block and is not an expression.

> :memo: **Note**
>
> Using _goto_ not as part of an [if](../../opcodes/if) statement (as in: goto end), will cause initialization to be skipped on all the code the _goto_ jumps over. In performance, leaving some opcodes uninitialized will cause deletion of the note/event. In these cases, using [kgoto](../../opcodes/kgoto) (as in: kgoto end) might be preferred.

## Examples

Here is an example of the goto opcode. It uses the file [goto.csd](../../examples/goto.csd).

``` csound-csd title="Example of the goto opcode." linenums="1"
--8<-- "examples/goto.csd"
```

## See also

[Program Flow Control](../../control/pgmctl)

## Credits

Example written by Kevin Conder.

Added a note by Jim Aikin.
