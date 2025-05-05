<!--
id:zdf_ladder
category:Signal Modifiers:Standard Filters
-->
# zdf_ladder
Zero-delay feedback implementation of a 4 pole (24 dB/oct) low-pass filter based on the Moog ladder filter.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = zdf_ladder(ain, xcf, xQ [, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig zdf_ladder ain, xcf, xQ [, istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- output signal.

_asig_ -- input signal.

_xcf_ -- filter cutoff frequency (i-, k-, or a-rate).

_xQ_ -- filter Q value (i-, k-, or a-rate). Range 0.5-25.0. Self-oscillation occurs at 25.0.

## Examples

Here is an example of the zdf_ladder opcode. It uses the file [zdf_ladder.csd](../examples/zdf_ladder.csd).

``` csound-csd title="Example of the zdf_ladder opcode." linenums="1"
--8<-- "examples/zdf_ladder.csd"
```

### References

This filter is based on the work of Will Pirkle that employs Vadim Zavalishin's work with bilinear tranforms to create topology-preserving transform (TPT) implementations of analog filters.

1.   Pirkle, Will. Designing Software Synthesizer Plug-ins in C++: For RackAFX, VST3, and Audio Units. CRC Press, 2014.
2.   Pirkle, Will. AN-4: Virtual Analog (VA) Filter Implementation. 2013.
3.   Zavalishin, Vadim. "The Art of VA filter design." Native Instruments, 2012.

## See also

[Standard filters: Zero-delay Feedback Filters (Virtual Analog)](../sigmod/standard.md)

## Credits

Author: Steven Yi<br>
April 2017<br>

New in Csound 6.09.0
