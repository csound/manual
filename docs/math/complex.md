# **Complex Arithmetic and Operators**

Csound supports all arithmetic and a set of operators for Complex variables
and arrays:

* +,-, * and / for Complex-Complex, Complex-k, and Complex-i expressions (returning Complex)
* +,-, * and / for Complex[]-Complex[] and Complex[]-k expressions (returning Complex)

For Complex and Complex[] types, the following functions are supported

* [abs](../opcodes/abs.md) -  magnitude
* [arg](../opcodes/arg.md) - argument 
* [complex](../opcodes/complex.md) - rectangular conversion 
* [conj](../opcodes/conj.md) - conjugation
* [imag](../opcodes/imag.md) - imaginary part
* [polar](../opcodes/polar.md) - polar conversion
* [real](../opcodes/real.md) - real part

Assignment and initialisation are also supported with comma-separated arguments for
both real and imaginary parts respectively, 

``` csound-orc
var:Complex = real:{k,i}, imag:{k,i}
```



