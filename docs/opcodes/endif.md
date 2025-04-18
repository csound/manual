<!--
id:endif
category:Instrument Control:Program Flow Control
-->
# endif
Closes a block of code that begins with an ["if...then"](../opcodes/if.md) statement.

## Syntax
``` csound-orc
endif
```

### Performance

Any block of code that begins with an ["if...then"](../opcodes/if.md) statement must end with an _endif_ statement.

## Examples

Here is an example of the endif opcode. It uses the file [endif.csd](../examples/endif.csd).

``` csound-csd title="Example of the endif opcode." linenums="1"
--8<-- "examples/endif.csd"
```

## See also

[Program Flow Control](../control/pgmctl.md)

More information on this opcode: [http://www.csoundjournal.com/2006spring/controlFlow.html](http://www.csoundjournal.com/2006spring/controlFlow.html), written by Steven Yi

## Credits

New in version 4.21
