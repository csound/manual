<!--
id:skf
category:Signal Modifiers:Standard Filters:Resonant
-->
# skf
Sallen-Key filter.

_skf_ is an digital implementation of a linear Sallen-Key analogue filter, which is a second-order filter with either lowpass or highpass responses.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = skf(asig, xcf, xK[, ihp, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig skf asig, xcf, xK[, ihp, istor]
    ```

### Initialization

_ihp_ -- if non-zero, select highpass response. Defaults to 0 (lowpass).

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input

_xcf_ -- filter cutoff frequency (a- or k-rate)

_xK_ -- Sallen-Key opamp gain, in the range 1 to 3. At 3 the filter self-oscillates. K=1. 586 gives a Butterworth response,  higher values are equivalent to Chebyshev responses (with peaking). At K=1 the filter is critically damped and the poles are real-valued.

## Examples

Here is an example of the skf opcode. It uses the file [skf.csd](../examples/skf.csd).

``` csound-csd title="Example of the skf opcode." linenums="1"
--8<-- "examples/skf.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Victor Lazzarini<br>
Feb 2021<br>
