<!--
id:break
category:Instrument Control:Program Flow Control
-->
# break
A syntactic looping construction used in for, while, and until loops.

## Syntax
``` csound-orc
break
```


### Performance

The _break_ statement exits a loop immediately, independently of the
current value of the loop index or controlling boolean expression.

## Examples

Here is an example of the break statement. It uses the file [break.csd](../examples/break.csd).

``` csound-csd title="Example of the break opcode." linenums="1"
--8<-- "examples/break.csd"
```

Its output should include lines like this, stopping at 2.000:

```
instr 1:	p4 = 4.000
instr 1:	p4 = 3.000
instr 1:	p4 = 2.000
```

## See also

[Program Flow Control: Looping Constructions](../control/pgmctl.md)

## Credits

New in Csound version 7
