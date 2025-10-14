<!--
id:continue
category:Instrument Control:Program Flow Control
-->
# continue
A syntactic looping construction used in for, while, and until loops.

## Syntax
``` csound-orc
continue
```


### Performance

The _continue_ statement skips the rest of the following loop body instructions and proceeds
with the next iteration of the loop.

## Examples

Here is an example of the continue statement. It uses the file [continue.csd](../examples/continue.csd).

``` csound-csd title="Example of the continue opcode." linenums="1"
--8<-- "examples/continue.csd"
```

Its output should include lines like this, skipping the line for 2.000:

```
instr 1:	p4 = 3.000
instr 1:	p4 = 1.000
instr 1:	p4 = 0.000
```

## See also

[Program Flow Control: Looping Constructions](../control/pgmctl.md)

## Credits

New in Csound version 7
