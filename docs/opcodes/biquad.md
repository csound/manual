<!--
id:biquad
category:Signal Modifiers:Standard Filters
-->
# biquad
A sweepable general purpose biquadratic digital filter.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = biquad(asig, kb0, kb1, kb2, ka0, ka1, ka2 [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares biquad asig, kb0, kb1, kb2, ka0, ka1, ka2 [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- if non-zero, intialization will be skipped. Default value 0. (New in Csound version 3.50)

### Performance

_asig_ -- input signal

_biquad_ is a general purpose biquadratic digital filter of the form:

$$
a_0 y(n) + a_1 y(n-1) + a_2 y(n-2) = b_0 x(n) + b_1 x(n-1) + b_2 x(n-2)
$$

This filter has the following frequency response:

$$
H(z) = \frac{B(z)}{A(z)} = \frac{b_0 + b_1 z^{-1} + b_2 z^{-2}}{a_0 + a_1 z^{-1} + a_2 z^{-2}}
$$

This type of filter is often encountered in digital signal processing literature. It allows six user-defined k-rate coefficients.

## Examples

=== "Modern"
    Here is an example of the biquad opcode. It uses the file [biquad-modern.csd](../examples/biquad-modern.csd).
    ``` csound-csd title="Example of the biquad opcode." linenums="1"
    --8<-- "examples/biquad-modern.csd"
    ```

=== "Classic"
    Here is an example of the biquad opcode. It uses the file [biquad.csd](../examples/biquad.csd).
    ``` csound-csd title="Example of the biquad opcode." linenums="1"
    --8<-- "examples/biquad.csd"
    ```

=== "Modern"
    Here is another example of the biquad opcode used for modal synthesis. It uses the file [biquad-2-modern.csd](../examples/biquad-2-modern.csd). See the [Modal Frequency Ratios](../misc/modalfreq.md) appendix for other frequency ratios.
    ``` csound-csd title="Example of the biquad opcode for modal synthesis." linenums="1"
    --8<-- "examples/biquad-2-modern.csd"
    ```

=== "Classic"
    Here is another example of the biquad opcode used for modal synthesis. It uses the file [biquad-2.csd](../examples/biquad-2.csd). See the [Modal Frequency Ratios](../misc/modalfreq.md) appendix for other frequency ratios.
    ``` csound-csd title="Example of the biquad opcode for modal synthesis." linenums="1"
    --8<-- "examples/biquad-2.csd"
    ```

## See also

[Standard filters: Biquad filters](../sigmod/standard.md)

## Credits

Author: Hans Mikelson<br>
October 1998<br>

New in Csound version 3.49
