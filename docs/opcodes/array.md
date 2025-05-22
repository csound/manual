<!--
id:array
category: Array Opcodes
-->
# array
Converts an input into an array, optionally creating it.

If the array does not exist, it is created. Otherwise, the data is
just copied into the array.

## Syntax
``` csound-orc
array(arg:a)
array(arg1:k, arg2:k, ...)
array(arg1:i, arg2:i, ...)
```

The a-type version produces an array with _ksmps_ numbers. The other versions produce an array with as many
numbers as their inputs.

## Examples

Here is an example of the a opcode. It uses the file [array.csd](../examples/array.csd).

``` csound-csd title="Example of the array opcode." linenums="1"
--8<-- "examples/array.csd"
```

## See also

[array opcodes](../math/array.md)


## Credits

Author: John ffitch, Victor Lazzarini  
a-sig version introduced in version 7.  
