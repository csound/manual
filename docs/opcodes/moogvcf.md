<!--
id:moogvcf
category:Signal Modifiers:Standard Filters:Resonant
-->
# moogvcf
A digital emulation of the Moog diode ladder filter configuration.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = moogvcf(asig, xfco, xres [,iscale, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares moogvcf asig, xfco, xres [,iscale, iskip]
    ```

### Initialization

_iscale_ (optional, default=1) -- internal scaling factor. Use if _asig_ is not in the range +/-1. Input is first divided by _iscale_, then output is mutliplied _iscale_. Default value is 1. (New in Csound version 3.50)

_iskip_ (optional, default=0) -- if non zero skip the initialisation of the filter. (New in Csound version 4.23f13 and 5.0)

### Performance

_asig_ -- input signal

_xfco_ -- filter cut-off frequency in Hz. As of version 3.50, may i-,k-, or a-rate.

_xres_ -- amount of resonance. Self-oscillation occurs when _xres_ is approximately one. As of version 3.50, may a-rate, i-rate, or k-rate.

_moogvcf_ is a digital emulation of the Moog diode ladder filter configuration. This emulation is based loosely on the paper &#8220;Analyzing the Moog VCF with Considerations for Digital Implementation&#8221; by Stilson and Smith (CCRMA). This version was originally coded in Csound by Josep Comajuncosas. Some modifications and conversion to C were done by Hans Mikelson.

> :warning: **Warning**
>
> Before version 6.02 this filter required that the input signal be normalized to one. This can be easily achieved using [0dbfs](../opcodes/0dbfs.md), like this:
>
> ``` csound-orc
> ares moogvcf asig, kfco, kres, 0dbfs
> ```
>
> You can also use [moogvcf2](../opcodes/moogvcf2.md) which defaults scaling to [0dbfs](../opcodes/0dbfs.md).

## Examples

Here is an example of the moogvcf opcode. It uses the file [moogvcf.csd](../examples/moogvcf.csd).

``` csound-csd title="Example of the moogvcf opcode." linenums="1"
--8<-- "examples/moogvcf.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Hans Mikelson<br>
October 1998<br>

New in Csound version 3.49
