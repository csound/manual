<!--
id:log
category:Mathematical Operations:Mathematical Functions
-->
# log
Returns the natural log of _x_ (_x_ positive only).

In the case of an array input, the operation can have an optional arbitrary base.

The argument value is restricted for _log_, [log10](../opcodes/log10.md), and [sqrt](../opcodes/sqrt.md).

## Syntax
``` csound-orc
log({a,k,i,Complex}) 
log({k[],i[],Complex[]}) 
kout[] log kin[], ibas
```

where the argument within the parentheses may be an expression. Value converters perform arithmetic translation from units of one kind to units of another. The result can then be a term in a further expression. In the case of an array input, ibas is the optional arbitrary base, which defaults to e (natural log base).

## Examples

Here is an example of the log opcode. It uses the file [log.csd](../examples/log.csd).

``` csound-csd title="Example of the log opcode." linenums="1"
--8<-- "examples/log.csd"
```

Its output should include a line like this:

```
instr 1:  i1 = 2.079
```

## See also

[Mathematical Functions](../math/mathfunc.md)

## Credits

Written by John ffitch.

New in version 3.47

Example written by Kevin Conder.
