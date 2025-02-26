<!--
id:opa
category:Signal Modifiers:Sample Level Operators
-->
# a
Converts a k-rate parameter to an a-rate value with interpolation.

## Syntax
``` csound-orc
a(x) (control-rate args only)
```

where the argument within the parentheses may be an expression. Value converters perform arithmetic translation from units of one kind to units of another. The result can then be a term in a further expression.

## Examples

Here is an example of the a opcode. It uses the file [opa.csd](../../examples/opa.csd).

``` csound-csd title="Example of the a opcode." linenums="1"
--8<-- "examples/opa.csd"
```

## See also

[Sample Level Operators](../../sigmod/sample)

More information on this opcode can be found in the [Csound Journal, issue 10](http://www.csounds.com/journal/issue10/CsoundRates.html), written by Andrés Cabrera.

## Credits

Author: Gabriel Maldonado

New in version 4.21
