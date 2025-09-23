<!--
id:diode_ladder
category:Signal Modifiers:Standard Filters
-->
# diode_ladder

Zero-delay feedback implementation of a 4 pole (24 dB/oct) diode low-pass filter.

This filter design was originally used in the EMS VCS3 and was the resonant filter in the Roland TB-303.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = diode_ladder(ain, xcf, xk [, inlp, isaturation, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig diode_ladder ain, xcf, xk [, inlp, isaturation, istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- low-pass output signal.

_ain_ -- input signal.

_xcf_ -- filter cutoff frequency (i-, k-, or a-rate).

_xk_ -- filter feedback value k (i-, k-, or a-rate) that controls resonance. Range 0.0-17.0 . Self-oscillation occurs at 17.0.

_knlp_ (optional, default=0) -- Non-linear processing method. 0 = no processing, 1 = higher-quality NLP, 2 = lower-quality NLP (faster). Method 1 uses (1.0 / tanh(ksaturation)) * tanh(ksaturation * input). Method 2 uses tanh(ksaturation * input). Enabling NLP may increase the overall output of filter above unity and should be compensated for outside of the filter.

_ksaturation_ (optional, default=1) -- saturation amount to use for non-linear processing. Values > 1 increase the steepness of the NLP curve.

## Examples

Here is an example of the diode_ladder opcode. It uses the file [diode_ladder.csd](../examples/diode_ladder.csd).

``` csound-csd title="Example of the diode_ladder opcode." linenums="1"
--8<-- "examples/diode_ladder.csd"
```

### References

This filter is based on the work of Will Pirkle that employs Vadim Zavalishin's work with bilinear tranforms to create topology-preserving transform (TPT) implementations of analog filters.

1.   Pirkle, Will. Designing Software Synthesizer Plug-ins in C++: For RackAFX, VST3, and Audio Units. CRC Press, 2014.
2.   Pirkle, Will. AN-6: Virtual Analog (VA) DiodeLadder Filter. 2013.
3.   Zavalishin, Vadim. "The Art of VA filter design." Native Instruments, 2012.

## See also

[Standard filters: Zero-delay Feedback Filters (Virtual Analog)](../sigmod/standard.md)

## Credits

Author: Steven Yi<br>
April 2017<br>

New in Csound 6.09.0
