<!--
id:rbjeq
category:Signal Modifiers:Specialized Filters
-->
# rbjeq
Parametric equalizer and filter opcode with 7 filter types, based on algorithm by Robert Bristow-Johnson.

## Syntax
=== "Modern"
    ``` csound-orc
    ar = rbjeq(asig, kfco, klvl, kQ, kS[, imode])
    ```

=== "Classic"
    ``` csound-orc
    ar rbjeq asig, kfco, klvl, kQ, kS[, imode]
    ```

### Initialization

_imode_ (optional, defaults to zero) - sum of:

*   1: skip initialization (should be used in tied, or re-initialized notes only)

and exactly one of the following values to select filter type:

*   0: resonant lowpass filter. kQ controls the resonance: at the cutoff frequency (kfco), the amplitude gain is kQ (e.g. 20 dB for kQ = 10), and higher kQ values result in a narrower resonance peak. If kQ is set to sqrt(0.5) (about 0.7071), there is no resonance, and the filter has a response that is very similar to that of butterlp. If kQ is less than sqrt(0.5), there is no resonance, and the filter has a -6 dB / octave response from about kfco * kQ to kfco. Above kfco, there is always a -12 dB / octave cutoff.

> :memo: **NOTE**
>
> The rbjeq lowpass filter is basically the same as ar pareq asig, kfco, 0, kQ, 2 but is faster to calculate.

*   2: resonant highpass filter. The parameters are the same as for the lowpass filter, but the equivalent filter is butterhp if kQ is 0.7071, and "ar pareq asig, kfco, 0, kQ, 1" in other cases.
*   4: bandpass filter. kQ controls the bandwidth, which is kfco / kQ, and must be always less than sr / 2. The bandwidth is measured between -3 dB points (i.e. amplitude gain = 0.7071), beyond which there is a +/- 6 dB / octave slope. This filter type is very similar to ar butterbp asig, kfco, kfco / kQ.
*   6: band-reject filter, with the same parameters as the bandpass filter, and a response similar to that of butterbr.
*   8: peaking EQ. It has an amplitude gain of 1 (0 dB) at 0 Hz and sr / 2, and klvl at the center frequency (kfco). Thus, klvl controls the amount of boost (if it is greater than 1), or cut (if it is less than 1). Setting klvl to 1 results in a flat response. Similarly to the bandpass and band-reject filters, the bandwidth is determined by kfco / kQ (which must be less than sr / 2 again); however, this time it is between sqrt(klvl) points (or, in other words, half the boost or cut in decibels). NOTE: excessively low or high values of klvl should be avoided (especially with 32-bit floats), though the opcode was tested with klvl = 0.01 and klvl = 100. klvl = 0 is always an error, unlike in the case of pareq, which does allow a zero level.
*   10: low shelf EQ, controlled by klvl and kS (kQ is ignored by this filter type). There is an amplitude gain of klvl at zero frequency, while the level of high frequencies (around sr / 2) is not changed. At the corner frequency (kfco), the gain is sqrt(klvl) (half the boost or cut in decibels). The kS parameter controls the steepness of the slope of the frequency response (see below).
*   12: high shelf EQ. Very similar to the low shelf EQ, but affects the high frequency range.

The default value for imode is zero (lowpass filter, initialization not skipped).

### Performance

_ar_ -- the output signal.

_asig_ -- the input signal

> :memo: **NOTE**
>
> If the input contains silent sections, on Intel CPUs a significant slowdown can occur due to denormals. In such cases, it is recommended to process the input signal with "denorm" opcode before filtering it with rbjeq (and actually many other filters).

_kfco_ -- cutoff, corner, or center frequency, depending on filter type, in Hz. It must be greater than zero, and less than sr / 2 (the range of about sr * 0.0002 to sr * 0.49 should be safe).

_klvl_ -- level (amount of boost or cut), as amplitude gain (e.g. 1: flat response, 4: 12 dB boost, 0.1: 20 dB cut); zero or negative values are not allowed. It is recognized by the peaking and shelving EQ types (8, 10, 12) only, and is ignored by other filters.

_kQ_ -- resonance (also kfco / bandwidth in many filter types). Not used by the shelving EQs (imode = 10 and 12). The exact meaning of this parameter depends on the filter type (see above), but it should be always greater than zero, and usually (kfco / kQ) less than sr / 2.

_kS_ -- shelf slope parameter for shelving filters. Must be greater than zero; a higher value means a steeper slope, with resonance if kS > 1 (however, a too high kS value may make the filter unstable). If kS is set to exactly 1, the shelf slope is as steep as possible without a resonance. Note that the effect of kS - especially if it is greater than 1 - also depends on klvl, and it does not have any well defined unit.

## Examples

Here is an example of the _rbjeq_ opcode. It uses the file [rbjeq.csd](../examples/rbjeq.csd).

``` csound-csd title="An example of the rbjeq opcode." linenums="1"
--8<-- "examples/rbjeq.csd"
```

## See also

[Specialized Filters: Parametric EQ](../sigmod/speciali.md)

## Credits

Original algorithm by Robert Bristow-Johnson<br>
Csound orchestra version by Josep M Comajuncosas, Aug 1999<br>
Converted to C (with optimizations and bug fixes) by Istvan Varga, Dec 2002<br>
