<!--
id:complex
category:Mathematical Operations:Mathematical Functions
-->
# conj
Returns a complex number, optionally in polar form.


## Syntax
``` csound-orc
complex(var:Complex)
complex(var:Complex[])
complex(arg1:k, arg2:k[,isPolar:i])
complex(real:k[], imag:k[])
complex(real:a, imag:a)
```

A complex number or a complex array is given as the result of this
function. For the k-var version, it is possible to return a polar 
complex number by setting the optional argument to 1, and the two
arguments are interpreted as magnitude and angle. 

The other opcode overloads all return in rectangular form, so the opcode can
be used as a polar-to-rectangular converter. The array and a-sig
versions return a Complex vector.


## See also

[Mathematical Functions](../math/mathfunc.md)
