<!--
id:fmanal
category:Signal Modifiers:Specialized Filters
-->
# fmanal
AM/FM analysis from quadrature signal.

This opcode attempts to extract the AM and FM signals off a quadrature signal (e.g. from a Hilbert transform).

## Syntax
=== "Modern"
    ``` csound-orc
    am, af = fmanal(are, aim)
    ```

=== "Classic"
    ``` csound-orc
    am, af fmanal are, aim
    ```

### Performance

_are_ -- real (cosine-phase) input signal

_aim_ -- imaginary (sine-phase) input signal

_am_ -- amplitude modulation envelope

_af_ -- frequency modulation envelope

_fmanal_ takes a signal in quadrature (real,
imag) and outputs the estimate AM and FM signals. The former is the modulus of each input sample pair (|re + j*im|) and the latter the derivative of arg(re + j*im). Each sample of the output is the estimated instantaneous amplitude and frequency of the input signal.

## Examples

Here is an example of the fmanal opcode. It uses the file [fmanal.csd](../examples/fmanal.csd).

``` csound-csd title="Example of the fmanal opcode." linenums="1"
--8<-- "examples/fmanal.csd"
```

## See also

[Specialized Filters: Other filters](../sigmod/speciali.md)

## Credits

Author: Victor Lazzarini<br>
2017<br>
