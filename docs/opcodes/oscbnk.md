<!--
id:oscbnk
category:Signal Generators:Basic Oscillators
-->
# oscbnk
Mixes the output of any number of oscillators.

This unit generator mixes the output of any number of oscillators. The frequency, phase, and amplitude of each oscillator can be modulated by two LFOs (all oscillators have a separate set of LFOs, with different phase and frequency); additionally, the output of each oscillator can be filtered through an optional parametric equalizer (also controlled by the LFOs).  This opcode is most useful for rendering ensemble (strings, choir, etc.) instruments.

Although the LFOs run at k-rate, amplitude, phase and filter modulation are interpolated internally, so it is possible (and recommended in most cases) to use this unit at low (~1000 Hz) control rates without audible quality degradation.

The start phase and frequency of all oscillators and LFOs can be set by a built-in seedable 31-bit random number generator, or specified manually in a function table (GEN2).

## Syntax
=== "Modern"
    ``` csound-orc
    ares = oscbnk(kcps, kamd, kfmd, kpmd, iovrlap, iseed, kl1minf, kl1maxf, \
                  kl2minf, kl2maxf, ilfomode, keqminf, keqmaxf, keqminl, keqmaxl, \
                  keqminq, keqmaxq, ieqmode, kfn [, il1fn] [, il2fn] [, ieqffn]   \
                  [, ieqlfn] [, ieqqfn] [, itabl] [, ioutfn])
    ```

=== "Classic"
    ``` csound-orc
    ares oscbnk kcps, kamd, kfmd, kpmd, iovrlap, iseed, kl1minf, kl1maxf, \
                kl2minf, kl2maxf, ilfomode, keqminf, keqmaxf, keqminl, keqmaxl, \
                keqminq, keqmaxq, ieqmode, kfn [, il1fn] [, il2fn] [, ieqffn]   \
                [, ieqlfn] [, ieqqfn] [, itabl] [, ioutfn]
    ```

### Initialization

_iovrlap_ -- Number of oscillator units.

_iseed_ -- Seed value for random number generator (positive integer in the range 1 to 2147483646 (2 ^ 31 - 2)). _iseed_ &lt;= 0 seeds from the current time.

_ieqmode_ -- Parametric equalizer mode

* -1: disable EQ (faster)
* 0: peak
* 1: low shelf
* 2: high shelf
* 3: peak (filter interpolation disabled)
* 4: low shelf (interpolation disabled)
* 5: high shelf (interpolation disabled)

The non-interpolated modes are faster, and in some cases (e.g. high shelf filter at low cutoff frequencies) also more stable; however, interpolation is useful for avoiding <quote>zipper noise</quote> at low control rates.

_ilfomode_ -- LFO modulation mode, sum of:

* 128: LFO1 to frequency
* 64: LFO1 to amplitude
* 32: LFO1 to phase
* 16: LFO1 to EQ
* 8: LFO2 to frequency
* 4: LFO2 to amplitude
* 2: LFO2 to phase
* 1: LFO2 to EQ

If an LFO does not modulate anything, it is not calculated, and the ftable number (_il1fn_ or _il2fn_) can be omitted.

_il1fn_ (optional: default=0) -- LFO1 function table number. The waveform in this table has to be normalized (absolute value &lt;= 1), and is read with linear interpolation.

_il2fn_ (optional: default=0) -- LFO2 function table number. The waveform in this table has to be normalized, and is read with linear interpolation.

_ieqffn, ieqlfn, ieqqfn_ (optional: default=0) -- Lookup tables for EQ frequency, level, and Q (optional if EQ is disabled). Table read position is 0 if the modulator signal is less than, or equal to -1, (table length / 2) if the modulator signal is zero, and the guard point if the modulator signal is greater than, or equal to 1. These tables have to be normalized to the range 0 - 1, and have an extended guard point (table length = power of two + 1). All tables are read with linear interpolation.

_itabl_ (optional: default=0) -- Function table storing phase and frequency values for all oscillators (optional). The values in this table are in the following order (5 for each oscillator unit):

```
oscillator phase, lfo1 phase, lfo1 frequency, lfo2 phase, lfo2 frequency, ...
```

All values are in the range 0 to 1; if the specified number is greater than 1, it is wrapped (phase) or limited (frequency) to the allowed range. A negative value (or end of table) will use the output of the random number generator.  The random seed is always updated (even if no random number was used), so switching one value between random and fixed will not change others.

_ioutfn_ (optional: default=0) -- Function table to write phase and frequency values (optional). The format is the same as in the case of _itabl_. This table is useful when experimenting with random numbers to record the best values.

The two optional tables (_itabl_ and _ioutfn_) are accessed only at i-time. This is useful to know, as the tables can be safely overwritten after opcode initialization, which allows precalculating parameters at i-time and storing in a temporary table before _oscbnk_ initialization.

### Performance

_ares_ -- Output signal.

_kcps_ -- Oscillator frequency in Hz.

_kamd_ -- AM depth (0 - 1).

```
(AM output) = (AM input) * ((1 - (AM depth)) + (AM depth) * (modulator))
```

If _ilfomode_ is not set to modulate the amplitude, then (AM output) = (AM input) regardless of the value of _kamd_. That means that _kamd_ will have no effect.

Note: Amplitude modulation is applied before the parametric equalizer.

_kfmd_ -- FM depth (in Hz).

_kpmd_ -- Phase modulation depth.

_kl1minf, kl1maxf_ -- LFO1 minimum and maximum frequency in Hz.

_kl2minf, kl2maxf_ --  LFO2 minimum and maximum frequency in Hz. (Note: oscillator and LFO frequencies are allowed to be zero or negative.)

_keqminf, keqmaxf_ -- Parametric equalizer minimum and maximum frequency in Hz.

_keqminl, keqmaxl_ -- Parametric equalizer minimum and maximum level.

_keqminq, keqmaxq_ -- Parametric equalizer minimum and maximum Q.

_kfn_ -- Oscillator waveform table. Table number can be changed at k-rate (this is useful to select from a set of band-limited tables generated by GEN30, to avoid aliasing). The table is read with linear interpolation.

> :memo: **Note**<br>
>
> _oscbnk_ uses the same random number generator as _rnd31_. So reading [its documentation](../opcodes/rnd31.md) is also recommended.
>

## Examples

Here is an example of oscbnk opcode. It uses the file [oscbnk.csd](../examples/oscbnk.csd).

``` csound-orc title="Example of the oscbnk opcode." linenums="1"
--8<-- "examples/oscbnk.csd"
```

Here is an advanced example of oscbnk opcode. It uses the file [oscbnk-advanced.csd](../examples/oscbnk-advanced.csd).

``` csound-orc title="Advanced example of the oscbnk opcode." linenums="1"
--8<-- "examples/oscbnk-advanced.csd"
```

## See also

[Basic Oscillators](../siggen/basic.md)

## Credits

Author: Istvan Varga<br>
2001<br>

New in version 4.15

Updated April 2002 by Istvan Varga
