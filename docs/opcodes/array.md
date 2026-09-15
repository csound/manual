<!--
id:array
category: Array Opcodes
-->
# array
Converts an input into an array, optionally creating it.

The audio-input form remains supported. It copies each block of audio into a k-rate array with _ksmps_ elements, creating the array if needed.

> :warning: **Deprecated initializers**
>
> Only the forms that initialize an array from a list of values are deprecated. Use [fillarray](fillarray.md) for these. The audio-input form is not deprecated.

## Syntax
``` csound-orc
kSamples[] = array(aSignal)
```

### Legacy value-list forms

These forms take initial values and remain available for compatibility:

``` csound-orc
iValues[] = array(ival1, ival2, ...)
kValues[] = array(ival1, ival2, ...)
```

For new code, use `fillarray`:

``` csound-orc
iValues[] = fillarray(1, 2, 3)
kValues[] = fillarray(1, 2, 3)
```

## Examples

Here is an example of the array opcode. It uses the file [array.csd](../examples/array.csd).

``` csound-csd title="Example of the array opcode." linenums="1"
--8<-- "examples/array.csd"
```

## See also

[fillarray](fillarray.md), [array opcodes](../math/array.md)


## Credits

Author: John ffitch, Victor Lazzarini  
a-sig version introduced in version 7.  
