<!--
id:mvclpf1
category:Signal Modifiers:Standard Filters:Resonant
-->
# mvclpf1
Moog voltage-controlled lowpass filter emulation.

Mvclpf1 is an digital implementation of the 4th-order (24 dB/oct)  Moog ladder filter originally written by Fons Andriaensen. According to the author, mvclpf1 "is a fairly simple design, and it does not even pretend to come close the 'real thing'. It uses a very crude approximation of the non-linear resistor in the first filter section only. [...] [I]t is [a] cheap (in terms of CPU usage) general purpose 24 dB/oct lowpass filter that could be useful".

## Syntax
=== "Modern"
    ``` csound-orc
    asig = mvclpf1(ain, xcf, xres[,istor])
    ```

=== "Classic"
    ``` csound-orc
    asig mvclpf1 ain, xcf, xres[,istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_ain_ -- input signal.

_xcf_ -- filter cutoff frequency. The useful range is around six octaves below and above middle C (pch 8.00).

_xres_ -- resonance, limited to the interval [0,1].

## Examples

Here is an example of the mvclpf1 opcode. It uses the file [mvclpf1.csd](../examples/mvclpf1.csd).

``` csound-csd title="Example of the mvclpf1 opcode." linenums="1"
--8<-- "examples/mvclpf1.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Fons Andriaensen, <br>
ported to Csound by Victor Lazzarini<br>
January 2016<br>

New in version 6.07

January 2016.
