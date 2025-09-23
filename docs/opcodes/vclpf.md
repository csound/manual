<!--
id:vclpf
category:Signal Modifiers:Standard Filters:Resonant
-->
# vclpf
Resonant 4pole linear lowpass filter.

Vclpf is an digital implementation of a standard 4-pole linear analogue filter, similar to the Moog, Arp, and SSM2040/2044 filters, consisting of four identical 1-pole filters with a feedback (resonance or regeneration) path. Unlike the moogladder opcode, this filter does not have any non-linearities, but its implementation preserves the analogue filter topology. The code is based on the work of Federico Fontana, described in the paper "PRESERVING THE STRUCTURE OF THE MOOG VCF IN THE DIGITAL DOMAIN" (Proceedings of ICMC 2007).

## Syntax
=== "Modern"
    ``` csound-orc
    asig = vclpf(ain, xcf, xres[, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig vclpf ain, xcf, xres[, istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input signal.

_xcf_ -- filter cutoff frequency (a- or k-rate)

_xres_ -- resonance, between 0 and 1. Higher values will make the filter self-oscillate (a- or k-rate).

## Examples

Here is an example of the vclpf opcode. It uses the file [vclpf.csd](../examples/vclpf.csd).

``` csound-csd title="Example of the vclpf opcode." linenums="1"
--8<-- "examples/vclpf.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Victor Lazzarini<br>
Feb 2021<br>
