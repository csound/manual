<!--
id:mvclpf4
category:Signal Modifiers:Standard Filters:Resonant
-->
# mvclpf4
Moog voltage-controlled lowpass filter emulation.

Mvclpf4 is an digital implementation of the 4th-order (24 dB/oct) Moog ladder filter originally written by Fons Andriaensen. It is a version of the mvclpf3 opcode with four outputs, for 6dB, 12dB, 18dB, and 24 dB/octave responses.

## Syntax
=== "Modern"
    ``` csound-orc
    asig1, asig2, asig3, asig4 = mvclpf4(ain, xcf, xres[, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig1, asig2, asig3, asig4 mvclpf4 ain, xcf, xres[, istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig1_ -- 6dB/oct low-pass response output.

_asig2_ -- 12dB/oct low-pass response output.

_asig3_ -- 18dB/oct low-pass response output..

_asig4_ -- 24dB/oct low-pass response output.

_ain_ -- input signal.

_xcf_ -- filter cutoff frequency. The useful range is around six octaves below and above middle C (pch 8.00).

_xres_ -- resonance, limited to the interval [0,1].

## Examples

Here is an example of the mvclpf4 opcode. It uses the file [mvclpf4.csd](../examples/mvclpf4.csd).

``` csound-csd title="Example of the mvclpf4 opcode." linenums="1"
--8<-- "examples/mvclpf4.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Fons Andriaensen, <br>
ported to Csound by Victor Lazzarini<br>
January 2016<br>

New in version 6.07

January 2016.
