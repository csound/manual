<!--
id:opk
category:Signal Modifiers:Sample Level Operators
-->
# k
Converts a i-rate parameter to an k-rate value or an a-rate value to a k-rate value by down-sampling.

For example to be used with [rnd()](../opcodes/rnd.md) and [birnd()](../opcodes/birnd.md) to generate random numbers at k-rate.

## Syntax
``` csound-orc
k(x) (i-rate args only)
k(x) (a-rate args only)
```

where the argument within the parentheses may be an expression. Value converters perform arithmetic translation from units of one kind to units of another. The result can then be a term in a further expression.

## See also

[Sample Level Operators](../sigmod/sample.md)

More information on this opcode can be found in the [Csound Journal, issue 10](http://www.csounds.com/journal/issue10/CsoundRates.html), written by Andrés Cabrera.

## Credits

Author: Istvan Varga

New in version Csound 5.00

Author: John ffitch

arate to krate new in version Csound 6.00
