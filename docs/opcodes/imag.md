<!--
id:imag
category:Mathematical Operations:Mathematical Functions
-->
# imag
Returns the imaginary part of a complex number.


## Syntax
``` csound-orc
imag(var:Complex)
imag(var:Complex[])
```

where the argument within the parentheses may be an expression. The
array version of the opcode has two overloads, one that returns a
k-rate array and another that returns an audio signal.

```
Array:k = imag(CplxArray)
sig:a = imag(CplxArray)
```

In the second case, the array should be one dimensional and 
contain a least `ksmps` complex
numbers. This opcode takes advantage of the fact that 
audio signals are imag-valued vectors, similarly to k-sig 
one-dimensional arrays.


## See also

[Mathematical Functions](../math/mathfunc.md)
