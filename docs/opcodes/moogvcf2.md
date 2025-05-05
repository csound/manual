<!--
id:moogvcf2
category:Signal Modifiers:Standard Filters:Resonant
-->
# moogvcf2
A digital emulation of the Moog diode ladder filter configuration.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = moogvcf2(asig, xfco, xres [,iscale, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares moogvcf2 asig, xfco, xres [,iscale, iskip]
    ```

### Initialization

_iscale_ (optional, default=0dBfs) -- internal scaling factor, as the operation of the code requires the signal to be in the range +/-1.  Input is first divided by _iscale_, then output is mutliplied by _iscale_.

_iskip_ (optional, default=0) -- if non zero skip the initialisation of the filter.

### Performance

_asig_ -- input signal

_xfco_ -- filter cut-off frequency in Hz. which may be i-,k-, or a-rate.

_xres_ -- amount of resonance. Self-oscillation occurs when _xres_ is approximately one. May be a-rate, i-rate, or k-rate.

_moogvcf2_ is a digital emulation of the Moog diode ladder filter configuration. This emulation is based loosely on the paper &#8220;Analyzing the Moog VCF with Considerations for Digital Implementation&#8221; by Stilson and Smith (CCRMA). This version was originally coded in Csound by Josep Comajuncosas. Some modifications and conversion to C were done by Hans Mikelson and then adjusted.

_moogvcf2_ is identical to [moogvcf](../opcodes/moogvcf.md), except that the _iscale_ parameter defaults to [0dbfs](../opcodes/0dbfs.md) instead of 0, guaranteeing that amplitude will usually be OK.

## Examples

Here is an example of the moogvcf2 opcode. It uses the file [moogvcf2.csd](../examples/moogvcf2.csd).

``` csound-csd title="Example of the moogvcf2 opcode." linenums="1"
--8<-- "examples/moogvcf2.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Hans Mikelson and John ffitch<br>
October 1998/ July 2006<br>

New in Csound version 5.03
