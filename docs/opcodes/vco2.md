<!--
id:vco2
category:Signal Generators:Dynamic Spectrum Oscillators
-->
# vco2
Implementation of a band-limited oscillator using pre-calculated tables.

_vco2_ is similar to [vco](../opcodes/vco.md). But the implementation uses pre-calculated tables of band-limited waveforms (see also [GEN30](../scoregens/gen30.md)) rather than integrating impulses. This opcode can be faster than _vco_ (especially if a low control-rate is used) and also allows better sound quality. Additionally, there are more waveforms and oscillator phase can be modulated at k-rate. The disadvantage is increased memory usage. For more details about vco2 tables, see also [vco2init](../opcodes/vco2init.md) and [vco2ft](../opcodes/vco2ft.md).

## Syntax
=== "Modern"
    ``` csound-orc
    ares = vco2(kamp, kcps [, imode] [, kpw] [, kphs] [, inyx])
    ```

=== "Classic"
    ``` csound-orc
    ares vco2 kamp, kcps [, imode] [, kpw] [, kphs] [, inyx]
    ```

### Initialization

_imode_ (optional, default=0) -- a sum of values representing the waveform and its control values.

One may use any of the following values for _imode_:

* 16: enable k-rate phase control (if set, _kphs_ is a required k-rate parameter that allows phase modulation)
* 1: skip initialization

One may use exactly one of these _imode_ values to select the waveform to be generated:

* 14: user defined waveform -1 (requires using the [vco2init](../opcodes/vco2init.md) opcode)
* 12: triangle (no ramp, faster)
* 10: square wave (no PWM, faster)
* 8: 4 * x * (1 - x) (i.e. integrated sawtooth)
* 6: pulse (not normalized)
* 4: sawtooth / triangle / ramp
* 2: square / PWM
* 0: sawtooth

The default value for _imode_ is zero, which means a sawtooth wave with no k-rate phase control.

_inyx_ (optional, default=0.5) -- bandwidth of the generated waveform, as percentage (0 to 1) of the sample rate. The expected range is 0 to 0.5 (i.e. up to [sr](../opcodes/sr.md)/2), other values are limited to the allowed range.

Setting _inyx_ to 0.25 (_sr_/4), or 0.3333 (_sr_/3) can produce a &#8220;fatter&#8221; sound in some cases, although it is more likely to reduce quality.

### Performance

_ares_ -- the output audio signal.

_kamp_ -- amplitude scale. In the case of a _imode_ waveform value of 6 (a pulse waveform), the actual output level can be a lot higher than this value.

_kcps_ -- frequency in Hz (should be in the range -_sr_/2 to _sr_/2).

_kpw_ (optional) -- the pulse width of the square wave (_imode_ waveform=2) or the ramp characteristics of the triangle wave (_imode_ waveform=4). It is required only by these waveforms and ignored in all other cases. The expected range is 0 to 1, any other value is wrapped to the allowed range.

> :warning: **Warning**<br>
>
> _kpw_ must not be an exact integer value (e.g. 0 or 1) if a sawtooth / triangle / ramp (_imode_ waveform=4) is generated. In this case, the recommended range is about 0.01 to 0.99. There is no such limitation for a square/PWM waveform.
>

_kphs_ (optional) -- oscillator phase (depending on _imode_, this can be either an optional i-rate parameter that defaults to zero or required k-rate). Similarly to _kpw_, the expected range is 0 to 1.

> :memo: **Note**
>
>  When a low control-rate is used, pulse width (_kpw_) and phase (_kphs_) modulation is internally converted to frequency modulation. This allows for faster processing and reduced artifacts. But in the case of very long notes and continuous fast changes in _kpw_ or _kphs_, the phase may drift away from the requested value. In most cases, the phase error is at most 0.037 per hour (assuming a sample rate of 44100 Hz).
>
>  This is a problem mainly in the case of pulse width (_kpw_), where it may result in various artifacts. While future releases of _vco2_ may fix such errors, the following work-arounds may also be of some help:
>
> * Use _kpw_ values only in the range 0.05 to 0.95. (There are more artifacts around integer values)
> * Try to avoid modulating _kpw_ by asymmetrical waveforms like a sawtooth wave. Relatively slow (&lt;= 20 Hz) symmetrical modulation (e.g. sine or triangle), random splines (also slow), or a fixed pulse width is a lot less likely to cause synchronization problems.
> * In some cases, adding random jitter (for example: random splines with an amplitude of about 0.01) to _kpw_ may also fix the problem.

## Examples

Here is an example of the vco2 opcode. It uses the file [vco2.csd](../examples/vco2.csd).

``` csound-orc title="Example of the vco2 opcode." linenums="1"
--8<-- "examples/vco2.csd"
```

## See Also

[Dynamic Spectrum Oscillators](../siggen/dynamic.md)

## Credits

Author: Istvan Varga

New in version 4.22
