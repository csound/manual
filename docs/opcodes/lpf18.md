<!--
id:lpf18
category:Signal Modifiers:Standard Filters:Resonant
-->
# lpf18
A 3-pole sweepable resonant lowpass filter.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = lpf18(asig, xfco, xres, xdist [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares lpf18 asig, xfco, xres, xdist [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- Skip initialization if present and non-zero.

### Performance

_xfco_ -- the filter cutoff frequency in Hz. Should be in the range 0 to _sr_/2.

_xres_ -- the amount of resonance. Self-oscillation occurs when _xres_ is approximately 1. Should usually be in the range 0 to 1, however, values slightly greater than 1 are possible for more sustained oscillation and an &#8220;overdrive&#8221; effect.

_xdist_ -- amount of distortion. _kdist_ = 0 gives a clean output. _xdist_ &gt; 0 adds _tanh_() distortion controlled by the filter parameters, in such a way that both low cutoff and high resonance increase the distortion amount. Some experimentation is encouraged.

_lpf18_ is a digital emulation of a 3 pole (18 dB/oct.) lowpass filter capable of self-oscillation with a built-in distortion unit. It is really a 3-pole version of [moogvcf](../opcodes/moogvcf.md), retuned, recalibrated and with some performance improvements. The tuning and feedback tables use no more than 6 adds and 6 multiplies per control rate. The distortion unit, itself, is based on a modified [tanh](../opcodes/tanh.md) function driven by the filter controls.

> :memo: **Note**
>
> Before version 6.04 this filter requires that the input signal be normalized to one.

## Examples

Here is an example of the lpf18 opcode. It uses the file [lpf18.csd](../examples/lpf18.csd).

``` csound-csd title="Example of the lpf18 opcode." linenums="1"
--8<-- "examples/lpf18.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Josep M Comajuncosas<br>
Spain<br>
December 2000<br>

New in Csound version 4.10

Audio rate parameters introduced in version 6.02

October 2013.
