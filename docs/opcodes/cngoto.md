<!--
id:cngoto
category:Instrument Control:Program Flow Control
-->
# cngoto
Transfers control on every pass when the condition is _not_ true.

## Syntax
``` csound-orc
cngoto condition, label
```

where _label_ is in the same instrument block and is not an expression, and where _condition_ uses one of the Relational operators (_&lt;_,_ =_, _&lt;=_, _==_, _!=_) (and _=_ for convenience, see also under [Conditional Values](../../control/conditional)).

## Examples

Here is an example of the cngoto opcode. It uses the file [cngoto.csd](../../examples/cngoto.csd).

``` csound-csd title="Example of the cngoto opcode." linenums="1"
--8<-- "examples/cngoto.csd"
```

Its output should include lines like:

```
kval = 0.000000, kfreq = 880.000000
kval = 0.999732, kfreq = 880.000000
kval = 1.999639, kfreq = 440.000000
```

## See also

[Program Flow Control](../../control/pgmctl)

## Credits

Example written by Kevin Conder.

New in version 4.21
