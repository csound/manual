<!--
id:until
category:Instrument Control:Program Flow Control
-->
# until
A syntactic looping construction.

## Syntax
``` csound-orc
until condition do
... od
```

### Performance

The statements between the _do_ and _od_ form the body of a loop which is obeyed until the conditional becomes true.

## Examples

Here is an example of the until construction. It uses the file [until.csd](../examples/until.csd).

``` csound-csd title="Example of the until opcode." linenums="1"
--8<-- "examples/until.csd"
```

Its output should include lines like this:

```
B  0.000 ..  1.000 T  1.000 TT  1.000 M:      0.0
new alloc for instr 1:
instr 1:  p4 = 3.000
instr 1:  p4 = 2.000
instr 1:  p4 = 1.000
instr 1:  p4 = 0.000
instr 1:  p4 = -1.000
B  1.000 ..  2.000 T  2.000 TT  2.000 M:      0.0
new alloc for instr 2:
instr 2:  p4 = 3.000
instr 2:  p4 = 2.000
instr 2:  p4 = 1.000
instr 2:  p4 = 0.000
instr 2:  p4 = -1.000
B  2.000 ..  3.000 T  3.000 TT  3.000 M:      0.0
```

## See also

[Program Flow Control: Looping Constructions](../control/pgmctl.md)

## Credits

John ffitch.

New in Csound version 5.14 with new parser
