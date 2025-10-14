<!--
id:for
category:Instrument Control:Program Flow Control
-->
# for
A syntactic looping construction.

## Syntax
``` csound-orc
for var in array-expr do
  ...
od
for var, index in array-expr do
  ...
od
```


### Performance

This expressions creates a loop controlled by an array expression or
variable. In the first form, the loop iterates for each element in the
array returned by _array-expr_, with the numeric value of the array
setting the value of _var_ at each iteration. The second form adds
an _index_ variable holding an index (0-based) used to access the
array. This can be used as a loop count.The statements between 
the _do_ and _od_ form the body of a loop. Loop array expressions
and variables are strictly of either i- or k-types.

The loop action time is determined by the following rules:

- if _var_ has been declared before the loop, the type (i or k)
of this variable determines the action time (init or perf).

- if _var_ has not yet been declared, the array-expression type
is used instead, and the variable is created to accept this type.

The _index_ variable, if not declared, is created to match the
type of _array-expr

## Examples

Here is an example of the while construction. It uses the file [forin.csd](../examples/forin.csd).

``` csound-csd title="Example of the while opcode." linenums="1"
--8<-- "examples/forin.csd"
```

Its output should include lines like this:

```
instr 1:	j = 1.000
instr 1:	j = 2.000
instr 1:	j = 3.000
instr 3:	i = 0.000	j = 2.000
instr 3:	i = 1.000	j = 4.000
instr 3:	i = 2.000	j = 6.000
instr 2:	    1.00000
instr 2:	    2.00000
instr 2:	    3.00000
```

## See also

[Program Flow Control: Looping Constructions](../control/pgmctl.md)

## Credits

Hlodver Sigurdsson

New in Csound version 7
