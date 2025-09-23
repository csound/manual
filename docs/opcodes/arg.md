<!--
id:arg
category:Mathematical Operations:Mathematical Functions
-->
# arg
Returns the argument of a complex number.


## Syntax
``` csound-orc
arg(var:Complex)
arg(var:Complex[])
```

where the argument within the parentheses may be an expression. The
array version of the opcode has two overloads, one that returns a
k-rate array and another that returns an audio signal.

```
Array:k = arg(CplxArray)
sig:a = arg(CplxArray)
```

In the second case, the array should be one dimensional and 
contain a least `ksmps` complex
numbers. This opcode takes advantage of the fact that 
audio signals are arg-valued vectors, similarly to k-sig 
one-dimensional arrays.


## See also

[Mathematical Functions](../math/mathfunc.md)
