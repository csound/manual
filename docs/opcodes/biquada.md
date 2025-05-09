<!--
id:biquada
category:Signal Modifiers:Standard Filters
-->
# biquada
A sweepable general purpose biquadratic digital filter with a-rate parameters.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = biquada(asig, ab0, ab1, ab2, aa0, aa1, aa2 [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares biquada asig, ab0, ab1, ab2, aa0, aa1, aa2 [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- if non-zero, intialization will be skipped. Default value 0. (New in Csound version 3.50)

### Performance

_asig_ -- input signal

_biquada_ is a general purpose biquadratic digital filter of the form:

$$
a_0 y(n) + a_1 y(n-1) + a_2 y(n-2) = b_0 x(n) + b_1 x(n-1) + b_2 x(n-2)
$$

This filter has the following frequency response:

$$
H(z) = \frac{B(z)}{A(z)} = \frac{b_0 + b_1 z^{-1} + b_2 z^{-2}}{a_0 + a_1 z^{-1} + a_2 z^{-2}}
$$

This type of filter is often encountered in digital signal processing literature. It allows six user-defined a-rate coefficients.

## Examples

=== "Modern"
    Here is an example of the biquada opcode. It uses the file
    [biquada-modern.csd](../examples/biquada-modern.csd).
    ``` csound-csd title="Example of the biquada opcode." linenums="1"
    --8<-- "examples/biquada-modern.csd"
    ```

=== "Classic"
    Here is an example of the biquada opcode. It uses the file
    [biquada.csd](../examples/biquada.csd).
    ``` csound-csd title="Example of the biquada opcode." linenums="1"
    --8<-- "examples/biquada.csd"
    ```

## See also

[Standard filters: Biquad filters](../sigmod/standard.md)

## Credits

Author: John ffitch after Hans Mikelson<br>
August 2001<br>

New in Csound version 4.13
