<!--
id:zdf_1pole
category:Signal Modifiers:Standard Filters
-->
# zdf_1pole
Zero-delay feedback implementation of a 1 pole (6 dB/oct) filter.

Offers low-pass (default), high-pass, and allpass output modes.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = zdf_1pole(ain, xcf [, kmode, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig zdf_1pole ain, xcf [, kmode, istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- high-pass output signal.

_asig_ -- input signal.

_xcf_ -- filter cutoff frequency (i-, k-, or a-rate).

_kmode_ -- filter output type. The default value is 0. The output mode may be one of the following.

* 0 - low-pass
* 1 - high-pass
* 2 - allpass

## Examples

Here is an example of the zdf_1pole opcode. It uses the file [zdf_1pole.csd](../examples/zdf_1pole.csd).

``` csound-csd title="Example of the zdf_1pole opcode." linenums="1"
--8<-- "examples/zdf_1pole.csd"
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
