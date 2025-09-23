<!--
id:lowpass2
category:Signal Modifiers:Standard Filters:Resonant
-->
# lowpass2
A resonant second-order lowpass filter.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = lowpass2(asig, kcf, kq [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares lowpass2 asig, kcf, kq [, iskip]
    ```

### Initialization

_iskip_ -- initial disposition of internal data space. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input signal to be filtered

_kcf_ -- cutoff or resonant frequency of the filter, measured in Hz

_kq_ -- Q of the filter, defined, for bandpass filters, as bandwidth/cutoff. _kq_ should be between 1 and 500

_lowpass2_ is a second order IIR lowpass filter, with k-rate controls for cutoff frequency (_kcf_) and Q (_kq_). As _kq_ is increased, a resonant peak forms around the cutoff frequency, transforming the lowpass filter response into a response that is similar to a bandpass filter, but with more low frequency energy. This corresponds to an increase in the magnitude and "sharpness" of the resonant peak. For high values of _kq_, a scaling function such as _balance_ may be required. In practice, this allows for the simulation of the voltage-controlled filters of analog synthesizers, or for the creation of a pitch of constant amplitude while filtering white noise.

## Examples

Here is an example of the lowpass2 opcode. It uses the file [lowpass2.csd](../examples/lowpass2.csd).

``` csound-csd title="Example of the lowpass2 opcode." linenums="1"
--8<-- "examples/lowpass2.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Sean Costello<br>
Seattle, Washington<br>
August 1999<br>

New in Csound version 4.0
