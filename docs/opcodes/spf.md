<!--
id:spf
category:Signal Modifiers:Standard Filters:Resonant
-->
# spf
Steiner-Parker filter.

Spf is a digital implementation of a linear Steiner-Parker analogue filter, which is a second-order multimode filter with three separate inputs for lowpass, highpass, and bandpass and one output.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = spf(alp,ahp,abp, xcf, xR[, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig spf alp,ahp,abp, xcf, xR[, istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_alp, ahp, abp_ -- lowpass, highpass and bandpass input signals. Different signals can be used as inputs; if the same signal is placed at the lowpass and highpass inputs, the result is a band-reject output for that signal. If the same signal is used for all inputs, an allpass filter results.

_xcf_ -- filter cutoff frequency (a- or k-rate)

_xR_ -- filter damping factor, which controls peaking (for bandpass, R = 1/Q, where Q is the ratio of centre frequency and  bandwidth). A value of sqrt(2) (approx 1.414) gives no peaking (Butterworth response), and lower values will make the filter peak and ring. A value of 0 turns the filter into a sinusoidal oscillator. Valid values in the range of 0 - 2. At 2, the filter has real poles and so it is equivalent to two first-order filters in series.

## Examples

Here is an example of the spf opcode. It uses the file [spf.csd](../examples/spf.csd).

``` csound-csd title="Example of the spf opcode." linenums="1"
--8<-- "examples/spf.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Victor Lazzarini<br>
Feb 2021<br>
