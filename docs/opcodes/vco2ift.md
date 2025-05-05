<!--
id:vco2ift
category:Signal Generators:Dynamic Spectrum Oscillators
-->
# vco2ift
Returns a table number at i-time for a given oscillator frequency and wavform.

_vco2ift_ is the same as [vco2ft](../opcodes/vco2ft.md), but works at i-time. It is suitable for use with opcodes that expect an i-rate table number (for example, [oscili](../opcodes/oscili.md)).

## Syntax
=== "Modern"
    ``` csound-orc
    ifn = vco2ift(icps, iwave [, inyx])
    ```

=== "Classic"
    ``` csound-orc
    ifn vco2ift icps, iwave [, inyx]
    ```

### Initialization

_ifn_ -- the ftable number.

_icps_ --  frequency in Hz. Zero and negative values are allowed. However, if the absolute value exceeds [sr](../opcodes/sr.md)/2 (or _sr_ * _inyx_), the selected table will contain silence.

_iwave_ -- the waveform for which table number is to be selected. Allowed values are:

* 0: sawtooth
* 1: 4 * x * (1 - x)   (integrated sawtooth)
* 2: pulse (not normalized)
* 3: square wave
* 4: triangle

Additionally, negative _iwave_ values select user defined waveforms (see also [vco2init](../opcodes/vco2init.md)).

_inyx_ (optional, default=0.5) -- bandwidth of the generated waveform, as percentage (0 to 1) of the sample rate. The expected range is 0 to 0.5 (i.e. up to [sr](../opcodes/sr.md)/2), other values are limited to the allowed range.

Setting _inyx_ to 0.25 (_sr_/4), or 0.3333 (_sr_/3) can produce a &#8220;fatter&#8221; sound in some cases, although it is more likely to reduce quality.

## Examples

Here is an example of the vco2ift opcode. It uses the file [vco2ift.csd](../examples/vco2ift.csd).

``` csound-orc title="Example of the vco2ift opcode." linenums="1"
--8<-- "examples/vco2ift.csd"
```

Its output should include a line like these:

```
instr 1:  ifn = 22.000
instr 1:  ifn = 8.000
instr 1:  ifn = 3.000
```

See the example for the [vco2](../opcodes/vco2.md) opcode too.

## See Also

[Dynamic Spectrum Oscillators](../siggen/dynamic.md)

## Credits

Author: Istvan Varga

New in version 4.22
