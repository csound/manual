<!--
id:elseif
category:Instrument Control:Program Flow Control
-->
# elseif
Defines another "if...then" condition when a "if...then" condition is false.

## Syntax
``` csound-orc
elseif xa R xb then
```

where _label_ is in the same instrument block and is not an expression, and where _R_ is one of the Relational operators (_&lt;_, _=_, _&lt;=_, _==_, _!=_) (and _=_ for convenience, see also under [Conditional Values](../control/conditional.md)).

### Performance

_elseif_ is used inside of a block of code between the ["if...then"](../opcodes/if.md) and [endif](../opcodes/endif.md) opcodes. When a "if...then" condition is false, it defines another "if...then" condition to be met. Any number of _elseif_ statements are allowed.

## Examples

Here is an example of the elseif opcode. It uses the file [elseif.csd](../examples/elseif.csd).

``` csound-csd title="Example of the elseif opcode." linenums="1"
--8<-- "examples/elseif.csd"
```

## See also

[Program Flow Control](../control/pgmctl.md)

More information on this opcode: [http://www.csoundjournal.com/2006spring/controlFlow.html](http://www.csoundjournal.com/2006spring/controlFlow.html), written by Steven Yi

## Credits

New in version 4.21
