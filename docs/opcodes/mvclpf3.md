<!--
id:mvclpf3
category:Signal Modifiers:Standard Filters:Resonant
-->
# mvclpf3
Moog voltage-controlled lowpass filter emulation.

Mvclpf3 is an digital implementation of the 4th-order (24 dB/oct) Moog ladder filter originally written by Fons Andriaensen. According to the author, mvclpf3 "is based on mvclpf2 , with two differences. It uses the the technique described by Stilson and Smith to extend the constant-Q range, and the internal sample frequency is doubled, giving a better approximation to the non-linear behaviour at high freqencies. This version has high Q over the entire frequency range and will oscillate up to above 10 kHz, while the two others show a decreasing Q at high frequencies. Mvclpf3  is reasonably well tuned, and can be 'played' as a VCO up to at least 5 kHz".

## Syntax
=== "Modern"
    ``` csound-orc
    asig = mvclpf3(ain, xcf, xres[, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig mvclpf3 ain, xcf, xres[, istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_ain_ -- input signal.

_xcf_ -- filter cutoff frequency. The useful range is around six octaves below and above middle C (pch 8.00).

_xres_ -- resonance, limited to the interval [0,1].

## Examples

Here is an example of the mvclpf3 opcode. It uses the file [mvclpf3.csd](../examples/mvclpf3.csd).

``` csound-csd title="Example of the mvclpf3 opcode." linenums="1"
--8<-- "examples/mvclpf3.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Fons Andriaensen, <br>
ported to Csound by Victor Lazzarini<br>
January 2016<br>

New in version 6.07

January 2016.
