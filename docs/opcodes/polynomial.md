<!--
id:polynomial
category:Mathematical Operations:Opcode Equivalents of Functions
-->
# polynomial
Efficiently evaluates a polynomial of arbitrary order.

The _polynomial_ opcode calculates a polynomial with a single a-rate input variable.  The polynomial is a sum of any number of terms in the form _kn*x^n_ where _kn_ is the nth coefficient of the expression.  These coefficients are k-rate values.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = polynomial(ain, k0 [, k1 [, k2 [...]]])
    ```

=== "Classic"
    ``` csound-orc
    aout polynomial ain, k0 [, k1 [, k2 [...]]]
    ```

### Performance

_ain_ --  the input signal used as the independent variable of the polynomial ("x").

_aout_ --  the output signal ("y").

_k0, k1, k2, ..._ --  the coefficients for each term of the polynomial.

If we consider the input parameter _ain_ to be "x" and the output _aout_ to be "y", then the _polynomial_ opcode calculates the following equation:

```
y = k0 + k1*x + k2*x^2 + k3*x^3 + ...
```

## Examples

Here is an example of the polynomial opcode. It uses the file [polynomial.csd](../examples/polynomial.csd).

``` csound-csd title="Example of the polynomial opcode." linenums="1"
--8<-- "examples/polynomial.csd"
```

## See also

[Waveshaping](../sigmod/wavshape.md)

[Opcode Equivalents of Functions](../math/opeqfunc.md)

## Credits

Author: Anthony Kozar<br>
January 2008<br>

New in Csound version 5.08
