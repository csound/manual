<!--
id:vco2ft
category:Signal Generators:Dynamic Spectrum Oscillators
-->
# vco2ft
Returns a table number at k-time for a given oscillator frequency and wavform.

_vco2ft_ returns the function table number to be used for generating the specified waveform at a given frequency. This function table number can be used by any Csound opcode that generates a signal by reading function tables (like [oscilikt](../opcodes/oscilikt.md)). The tables must be calculated by [vco2init](../opcodes/vco2init.md) before _vco2ft_ is called and shared as Csound ftables (_ibasfn_).

## Syntax
=== "Modern"
    ``` csound-orc
    kfn = vco2ft(kcps, iwave [, inyx])
    ```

=== "Classic"
    ``` csound-orc
    kfn vco2ft kcps, iwave [, inyx]
    ```

### Initialization

_iwave_ -- the waveform for which table number is to be selected. Allowed values are:

* 0: sawtooth
* 1: 4 * x * (1 - x)   (integrated sawtooth)
* 2: pulse (not normalized)
* 3: square wave
* 4: triangle

Additionally, negative _iwave_ values select user defined waveforms (see also [vco2init](../opcodes/vco2init.md)).

_inyx_ (optional, default=0.5) -- bandwidth of the generated waveform, as percentage (0 to 1) of the sample rate. The expected range is 0 to 0.5 (i.e. up to [sr](../opcodes/sr.md)/2), other values are limited to the allowed range.

Setting _inyx_ to 0.25 (_sr_/4), or 0.3333 (_sr_/3) can produce a &#8220;fatter&#8221; sound in some cases, although it is more likely to reduce quality.

### Performance

_kfn_ -- the ftable number, returned at k-rate.

_kcps_ -- frequency in Hz, returned at k-rate. Zero and negative values are allowed. However, if the absolute value exceeds _sr_/2 (or _sr_ * _inyx_), the selected table will contain silence.

## Examples

See the example for the [vco2](../opcodes/vco2.md) opcode.

## See Also

[Dynamic Spectrum Oscillators](../siggen/dynamic.md)

## Credits

Author: Istvan Varga

New in version 4.22
