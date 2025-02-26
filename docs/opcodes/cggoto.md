<!--
id:cggoto
category:Instrument Control:Program Flow Control
-->
# cggoto
Conditionally transfer control to _label_ on every pass. (Combination of [cigoto](../../opcodes/cigoto) and [ckgoto](../../opcodes/ckgoto))

## Syntax
``` csound-orc
cggoto condition, label
```

where _label_ is in the same instrument block and is not an expression, and where _condition_ uses one of the Relational operators (_&lt;_,_ =_, _&lt;=_, _==_, _!=_) (and _=_ for convenience, see also under [Conditional Values](../../control/conditional)).

## Examples

Here is an example of the cggoto opcode. It uses the file [cggoto.csd](../../examples/cggoto.csd).

``` csound-csd title="Example of the cggoto opcode." linenums="1"
--8<-- "examples/cggoto.csd"
```

## See also

[Program Flow Control](../../control/pgmctl)

## Credits

Example written by Kevin Conder.
