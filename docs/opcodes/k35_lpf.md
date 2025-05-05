<!--
id:k35_lpf
category:Signal Modifiers:Standard Filters
-->
# K35_lpf
Zero-delay feedback implementation of Korg35 resonant low-pass filter.

This filter design is found in the Korg MS10, early MS20, and Monotron series.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = K35_lpf(ain, xcf, xQ [, inlp, isaturation, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig K35_lpf ain, xcf, xQ [, inlp, isaturation, istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- output signal.

_ain_ -- input signal.

_xcf_ -- filter cutoff frequency (i-, k-, or a-rate).

_xQ_ -- filter Q value (i-, k-, or a-rate). Range 1.0-10.0 (clamped by opcode). Self-oscillation occurs at 10.0.

_knlp_ (optional, default=0) -- Non-linear processing method. 0 = no processing, 1 = non-linear processing. Method 1 uses tanh(ksaturation * input). Enabling NLP may increase the overall output of filter above unity and should be compensated for outside of the filter.

_ksaturation_ (optional, default=1) -- saturation amount to use for non-linear processing. Values > 1 increase the steepness of the NLP curve.

## Examples

Here is an example of the K35_lpf opcode. It uses the file [k35.csd](../examples/k35.csd).

``` csound-csd title="Example of the K35_lpf opcode." linenums="1"
--8<-- "examples/k35.csd"
```

### References

This filter is based on the work of Will Pirkle that employs Vadim Zavalishin's work with bilinear tranforms to create topology-preserving transform (TPT) implementations of analog filters.

1.   Pirkle, Will. Designing Software Synthesizer Plug-ins in C++: For RackAFX, VST3, and Audio Units. CRC Press, 2014.
2.   Pirkle, Will. AN-5: Virtual Analog (VA) Korg35 Lowpass Filter v3.5. 2013.
3.   Zavalishin, Vadim. "The Art of VA filter design." Native Instruments, 2012.

## See also

[Standard filters: Zero-delay Feedback Filters (Virtual Analog)](../sigmod/standard.md)

## Credits

Author: Steven Yi<br>
April 2017<br>

New in Csound 6.09.0
