<!--
id:cigoto
category:Instrument Control:Program Flow Control
-->
# cigoto
During the i-time pass only, conditionally transfer control to the statement labeled by _label_.

## Syntax
``` csound-orc
cigoto condition, label
```

where _label_ is in the same instrument block and is not an expression, and where _condition_ uses one of the Relational operators (_&lt;_,_ =_, _&lt;=_, _==_, _!=_) (and _=_ for convenience, see also under [Conditional Values](../../control/conditional)).

## Examples

Here is an example of the cigoto opcode. It uses the file [cigoto.csd](../../examples/cigoto.csd).

``` csound-csd title="Example of the cigoto opcode." linenums="1"
--8<-- "examples/cigoto.csd"
```

Its output should include lines like:

```
instr 1:  iparam = 0.000
instr 1:  ifreq = 440.000
instr 1:  iparam = 1.000
instr 1:  ifreq = 880.000
```

## See also

[Program Flow Control](../../control/pgmctl)

## Credits

Example written by Kevin Conder.
