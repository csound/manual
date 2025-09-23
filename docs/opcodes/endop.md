<!--
id:endop
category:Orchestra Syntax:Block Statements
-->
# endop
Marks the end of an user-defined opcode block.

## Syntax
``` csound-orc
endop
```

### Performance

The syntax of a user-defined opcode block is as follows:

``` csound-orc
opcode  name, outtypes, intypes
xinarg1 [, xinarg2] [, xinarg3] ... [xinargN]  xin
[setksmps  iksmps]
... the rest of the instrument's code.
xout  xoutarg1 [, xoutarg2] [, xoutarg3] ... [xoutargN]
endop
```

The new opcode can then be used with the usual syntax:

``` csound-orc
[xinarg1] [, xinarg2] ... [xinargN]  name  [xoutarg1] [, xoutarg2] ... \
                                           [xoutargN] [, iksmps]
```

## Examples

Here is an example of the endop opcode. It uses the file [endop.csd](../examples/endop.csd).

``` csound-csd title="Example of the endop opcode." linenums="1"
--8<-- "examples/endop.csd"
```

## See Also

[User Defined Opcodes (UDO)](../orch/user-defined-opcodes.md)

More information on this opcode: [http://www.csoundjournal.com/2006summer/controlFlow_part2.html](http://www.csoundjournal.com/2006summer/controlFlow_part2.html)  , written by Steven Yi

The user-defined opcode page: [http://www.csounds.com/udo/](http://www.csounds.com/udo/)  , maintained by Steven Yi

## Credits

Author: Istvan Varga, 2002; based on code by Matt J. Ingalls

New in version 4.22
