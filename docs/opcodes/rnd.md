<!--
id:rnd
category:Mathematical Operations:Random Functions
-->
# rnd
Returns a random number in a unipolar range at the rate given by the input argument.

## Syntax
``` csound-orc
rnd(x) (init- or control-rate only)
```

Where the argument within the parentheses may be an expression. These value converters sample a global random sequence, but do not reference _seed_. The result can be a term in a further expression.

### Performance

Returns a random number in the unipolar range 0 to _x_.

## Examples

Here is an example of the rnd opcode. It uses the file [rnd.csd](../examples/rnd.csd).

``` csound-orc title="Example of the rnd opcode." linenums="1"
--8<-- "examples/rnd.csd"
```

Its output should be:

```
SECTION 1:
new alloc for instr 1:
instr 1:  irand = 9.735
new alloc for instr 1:
instr 1:  irand = 1.394
new alloc for instr 1:
instr 1:  irand = 7.695
midi channel 1 now using instr 1
B  0.000 ..  2.000 T  2.000 TT  2.000 M:  0.00000
new alloc for instr 2:
i   2 time     2.10000:     5.25005
i   2 time     2.20000:     6.22665
i   2 time     2.30000:     9.69511
i   2 time     2.40000:     7.16822
i   2 time     2.50000:     9.45134
i   2 time     2.60000:     1.34123
i   2 time     2.70000:     2.09879
i   2 time     2.80000:     2.36001
i   2 time     2.90000:     0.03553
```

Here is another example of the rnd opcode. It uses the file [rnd-advanced.csd](../examples/rnd-advanced.csd).

``` csound-orc title="Advanced example of the rnd opcode." linenums="1"
--8<-- "examples/rnd-advanced.csd"
```

## See also

[Random Functions](../math/rndfunc.md)

## Credits

Author: Barry L. Vercoe<br>
MIT<br>
Cambridge, Massachussetts<br>
1997<br>
