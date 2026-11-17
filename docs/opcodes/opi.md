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

The argument is read at init time, so it must have a value then. An expression computed at k-rate has none, and is refused when the orchestra compiles, in the functional form, `i(...)`, and in the classic form, `result i ...`, alike. The argument can be:

* a variable, at k-rate or i-rate;
* a number, signed or not;
* a member of a struct, or of a struct array's element at i-rate indices.

An expression (`value + 1`, `-value`, `abs(value)`, a ternary) is refused with *Use of i() with expression not permitted*, and an array element (`values[1]`) with *Use of i() with array element ill formed*. To read an element of a k-rate array at init time, use the second form.

In the second form, an index must also have a value at init time. A variable, an i-rate expression or comparison, and an element read at i-rate indices are taken. An index computed at k-rate, such as `index + 1`, `abs(index)`, a comparison of k-rate values or an element read at a k-rate index, is refused with *Use of i() with a k-rate expression as index not permitted*. To compute an index from a k-rate variable, convert the variable first: `i(values, i(index) + 1)`.

An expression of i-rate values is refused too, as there is nothing to convert: write it as a plain assignment. To compute from a k-rate value at init time, convert the value first, then compute:

``` csound-orc
result:i = ival + 1               ; rather than  result:i i ival + 1
result:i = i(values, 1)           ; rather than  result:i i values[1]
next:i = i(kvalue) + 1            ; rather than  next:i = i(kvalue + 1)
first:i = i(values, i(index) + 1) ; rather than  first:i = i(values, index + 1)
```

> :memo: **Note**
>
> In Csound 7.0.0 and earlier, the classic form took an expression: one computed at k-rate gave 0, and one of i-rate values, or an array element at i-rate indices, gave its value. Both are now refused, as in the functional form. The second form read the element at index 0 for an index computed at k-rate.


## See also

[Sample Level Operators](../sigmod/sample.md)

More information on this opcode can be found in the [Csound Journal, issue 10](http://www.csounds.com/journal/issue10/CsoundRates.html), written by Andrés Cabrera.

## Credits

i-rate arg version of function new since 5.14

Array format new in version 6.08
