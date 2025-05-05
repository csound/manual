<!--
id:mvchpf
category:Signal Modifiers:Standard Filters:Resonant
-->
# mvchpf
Moog voltage-controlled highpass filter emulation.

Mvchpf is an digital implementation of the 4th-order (24 dB/oct)  Moog high-pass filter, originally written by Fons Andriaensen. According to the author, mvchpf "...is based on the voltage controlled highpass filter by Robert Moog. again with some attention to the nonlinear effects."

## Syntax
=== "Modern"
    ``` csound-orc
    asig = mvchpf(ain, xcf[, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig mvchpf ain, xcf[, istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_ain_ -- input signal.

_xcf_ -- filter
cutoff frequency. The useful range is around six octaves below and above middle C (pch 8.00).

## Examples

Here is an example of the mvchpf opcode. It uses the file [mvchpf.csd](../examples/mvchpf.csd).

``` csound-csd title="Example of the mvchpf opcode." linenums="1"
--8<-- "examples/mvchpf.csd"
```

## See also

[Standard Filters: Hi-pass filters](../sigmod/standard.md)

## Credits

Author: Fons Andriaensen, <br>
ported to Csound by Victor Lazzarini<br>
January 2016<br>

New in version 6.07

January 2016.
