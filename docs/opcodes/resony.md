<!--
id:resony
category:Signal Modifiers:Standard Filters:Resonant
-->
# resony
A bank of second-order bandpass filters, connected in parallel.


## Syntax
=== "Modern"
    ``` csound-orc
    ares = resony(asig, kbf, kbw, inum, ksep [, isepmode] [, iscl] [, iskip] [, icorrect])
    ```

=== "Classic"
    ``` csound-orc
    ares resony asig, kbf, kbw, inum, ksep [, isepmode] [, iscl] [, iskip] [, icorrect]
    ```

### Initialization

_inum_ -- number of filters, rounded to the nearest integer. Values below 0.5 select four filters. The formulas below use this effective count.

_isepmode_ (optional, default=0) -- selects octave spacing when zero and linear spacing when nonzero. With the default _icorrect_=0, this value is first truncated to an integer, so values between -1 and 1 select octave spacing. With _icorrect_=1, every nonzero value selects corrected linear spacing.

_iscl_ (optional, default=0) -- coded scaling factor for resonators. A value of 1 signifies a peak response factor of 1, i.e. all frequencies other than _kcf_ are attenuated in accordance with the (normalized) response curve. A value of 2 raises the response factor so that its overall RMS value equals 1. (This intended equalization of input and output power assumes all frequencies are physically present; hence it is most applicable to white noise.) A zero value signifies no scaling of the signal, leaving that to some later adjustment (e.g. [balance](../opcodes/balance.md)). The default value is 0.

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

_icorrect_ (optional, default=0) -- selects the spacing calculation. Use 0 to preserve the original result for existing scores, or 1 to enable corrected linear spacing in hertz, starting at the base frequency. Only 0 and 1 are accepted. Added in Csound 7.0.

### Performance

_asig_ -- audio input signal

_kbf_ -- base frequency in Hz. This is the first filter's center frequency for octave spacing and corrected linear spacing. It must be nonzero when _icorrect_=1.

_kbw_ -- bandwidth in Hz at the base frequency. Each filter's bandwidth is scaled by its center frequency divided by _kbf_.

_ksep_ -- total spacing parameter, divided by _inum_ to obtain the step between filters. Its unit is octaves for octave spacing, hertz for corrected linear spacing, and a multiplier for the original linear calculation.

For filter index `j = 0, 1, ..., inum - 1`, the center frequency is:

| Spacing | Center frequency |
| --- | --- |
| Octave | `kbf * 2^(ksep * j / inum)` |
| Original linear (`icorrect = 0`) | `kbf * (ksep / inum) * j` |
| Corrected linear (`icorrect = 1`) | `kbf + (ksep / inum) * j` |

The original linear formula starts at 0 Hz and multiplies the spacing by the base frequency. This behavior remains the default for compatibility, including its silent first filter when normalization is enabled. Corrected linear spacing can change the sound of an existing score, so it must be selected explicitly.

For example, `kbf = 700`, `inum = 3`, `ksep = 900`, `isepmode = 1`, and `icorrect = 1` produce filter centers at 700, 1000, and 1300 Hz.

## Examples

Here is an example of the resony opcode. It uses the file [resony.csd](../examples/resony.csd).

``` csound-csd title="Example of the resony opcode." linenums="1"
--8<-- "examples/resony.csd"
```

This example selects corrected linear spacing with the final argument:

``` csound-csd
--8<-- "examples/resony_corrected.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1999<br>

New in Csound version 3.56
