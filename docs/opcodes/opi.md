<!--
id:opi
category:Signal Modifiers:Sample Level Operators
-->
# i
Returns an init-type equivalent of a k-rate argument or array element or directly returns an i-rate argument.

## Syntax
``` csound-orc
i(x) (control-rate or init-rate arg)
i(karray,index1, ...) (k-array with indices)
```

Value converters perform arithmetic translation from units of one kind to units of another. The result can then be a term in a further expression.

> :memo: **Note**
>
> Using i() with a k-rate expression argument is not recommended, and can produce unexpected results.
>
> To get the value from an array element reliably the second form should be used.


## See also

[Sample Level Operators](../sigmod/sample.md)

More information on this opcode can be found in the [Csound Journal, issue 10](http://www.csounds.com/journal/issue10/CsoundRates.html), written by Andrés Cabrera.

## Credits

i-rate arg version of function new since 5.14

Array format new in version 6.08
