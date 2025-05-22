<!--
id:opa
category:Signal Modifiers:Sample Level Operators
-->
# a
Converts a k-sig or k-array parameter to an a-sig output.

The k-sig version interpolates linearly its input to create the audio
signal. The k-array opcode copies the first _ksmps_ numbers in the
array to an audio signal.

## Syntax
``` csound-orc
a(k)
a(k[])
```

where the argument within the parentheses may be an expression. Value converters perform arithmetic translation from units of one kind to units of another. The result can then be a term in a further expression.

## Examples

Here is an example of the a opcode. It uses the file [opa.csd](../examples/opa.csd).

``` csound-csd title="Example of the a opcode." linenums="1"
--8<-- "examples/opa.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)

More information on this opcode can be found in the [Csound Journal, issue 10](http://www.csounds.com/journal/issue10/CsoundRates.html), written by Andrés Cabrera.

## Credits

Author: Gabriel Maldonado

New in version 4.21
Array overload introduced in version 7.
