<!--
id:abs
category:Mathematical Operations:Mathematical Functions
-->
# abs
Returns the absolute value of its input.

In the case of a complex variable, the absolute value is equivalent to
the magnitude of the number.

## Syntax
``` csound-orc
abs(var:{i,k,a}) 
abs(var:{k[],i[]})
abs(var:Complex)
abs(var:Complex[])
```

where the argument within the parentheses may be an expression. Value
converters perform arithmetic translation from units of one kind to
units of another. The result can then be a term in a further
expression.

The complex array version of the opcode has two overloads, one that returns a
k-rate array and another that returns an audio signal.

```
Array:k = abs(CplxArray)
sig:a = abs(CplxArray)
```

In the second case, the array should be one dimensional and 
contain a least `ksmps` complex
numbers. This opcode takes advantage of the fact that 
audio signals are real-valued vectors, similarly to k-sig 
one-dimensional arrays.


## Examples

=== "Modern"
    Here is an example of the abs opcode. It uses the file [abs-modern.csd](../examples/abs-modern.csd).
    ``` csound-csd title="Example of the abs opcode." linenums="1"
    --8<-- "examples/abs-modern.csd"
    ```

=== "Classic"
    Here is an example of the abs opcode. It uses the file [abs.csd](../examples/abs.csd).
    ``` csound-csd title="Example of the abs opcode." linenums="1"
    --8<-- "examples/abs.csd"
    ```

Its output should include lines like:

```
instr 1:  iabs = 0.000
instr 1:  iabs = 0.150
instr 1:  iabs = 13.000
```

## See also

[Mathematical Functions](../math/mathfunc.md)
