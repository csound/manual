<!--
id:else
category:Instrument Control:Program Flow Control
-->
# else
Executes a block of code when an "if...then" condition is false.

## Syntax
``` csound-orc
else
```

### Performance

_else_ is used inside of a block of code between the ["if...then"](../opcodes/if.md) and [endif](../opcodes/endif.md) opcodes. It defines which statements are executed when a "if...then" condition is false. Only one _else_ statement may occur and it must be the last conditional statement before the _endif_ opcode.

## Examples

Here is an example of the else opcode. It uses the file [else.csd](../examples/else.csd).

``` csound-csd title="Example of the else opcode." linenums="1"
--8<-- "examples/else.csd"
```

## See also

[Program Flow Control](../control/pgmctl.md)

More information on this opcode: [http://www.csoundjournal.com/2006spring/controlFlow.html](http://www.csoundjournal.com/2006spring/controlFlow.html), written by Steven Yi

## Credits

New in version 4.21
