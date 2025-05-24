<!--
id:exp
category:Mathematical Operations:Mathematical Functions
-->
# exp
Returns e raised to the xth power.

## Syntax
``` csound-orc
exp({a,k,i,Complex})
exp({k[],i[],Complex[]})
```

where the argument within the parentheses may be an expression. Value converters perform arithmetic translation from units of one kind to units of another. The result can then be a term in a further expression.

## Examples

Here is an example of the exp opcode. It uses the file [exp.csd](../examples/exp.csd).

``` csound-csd title="Example of the exp opcode." linenums="1"
--8<-- "examples/exp.csd"
```

Its output should include lines like this:

```
new alloc for instr 1:
instr 1:  i1 = 7.389
B  0.000 ..  1.000 T  1.000 TT  1.000 M:  0.00000  0.00000
.........
```

Here is another example of the exp opcode. It uses the file [exp-musical.csd](../examples/exp-musical.csd).

``` csound-csd title="Musical example of the exp opcode." linenums="1"
--8<-- "examples/exp-musical.csd"
```

Its output should include lines like this:

```
Generated events per second: 1
rtevent:     T  0.000 TT  0.000 M:  0.00000  0.00000
new alloc for instr 10:
rtevent:     T  0.811 TT  0.811 M:  0.48906  0.48906
new alloc for instr 10:
Generated events per second: 2
rtevent:     T  1.387 TT  1.387 M:  0.48611  0.48611
rtevent:     T  1.833 TT  1.833 M:  0.48421  0.48421
Generated events per second: 3
rtevent:     T  2.198 TT  2.198 M:  0.47536  0.47536
rtevent:     T  2.506 TT  2.506 M:  0.46530  0.46530
rtevent:     T  2.773 TT  2.773 M:  0.44986  0.44986
Generated events per second: 4
rtevent:     T  3.009 TT  3.009 M:  0.48096  0.48096
.........
```

## See also

[Mathematical Functions](../math/mathfunc.md)

## Credits
New in version 4.21
