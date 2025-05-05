<!--
id:mvclpf2
category:Signal Modifiers:Standard Filters:Resonant
-->
# mvclpf2
Moog voltage-controlled lowpass filter emulation.

Mvclpf2 is an digital implementation of the 4th-order (24 dB/oct) Moog ladder filter originally written by Fons Andriaensen. According to the author, mvclpf2 "uses five non-linear elements, in the input and in all four filter sections. It works by using the derivative of the nonlinearity (for which 1 / (1 + x * x) is reasonable approximation). The main advantage of this is that only one evaluation of the non-linear function is required for each section".

## Syntax
=== "Modern"
    ``` csound-orc
    asig = mvclpf2(ain, xcf, xres[, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig mvclpf2 ain, xcf, xres[, istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_ain_ -- input signal.

_xcf_ -- filter cutoff frequency. The useful range is around six octaves below and above middle C (pch 8.00).

_xres_  -- resonance, limited to the interval [0,1].

## Examples

Here is an example of the mvclpf2 opcode. It uses the file [mvclpf2.csd](../examples/mvclpf2.csd).

``` csound-csd title="Example of the mvclpf2 opcode." linenums="1"
--8<-- "examples/mvclpf2.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Fons Andriaensen, <br>
ported to Csound by Victor Lazzarini<br>
January 2016<br>

New in version 6.07

January 2016.
