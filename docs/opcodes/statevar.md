<!--
id:statevar
category:Signal Modifiers:Standard Filters:Resonant
-->
# statevar
Statevar is a new digital implementation of the analogue state-variable filter.

This filter has four simultaneous outputs: high-pass, low-pass, band-pass and band-reject. This filter uses oversampling for sharper resonance (default: 3 times oversampling). It includes a resonance limiter that prevents the filter from getting unstable.

## Syntax
=== "Modern"
    ``` csound-orc
    ahp, alp, abp, abr = statevar(ain, xcf, xq [, iosamps, istor])
    ```

=== "Classic"
    ``` csound-orc
    ahp, alp, abp, abr statevar ain, xcf, xq [, iosamps, istor]
    ```

### Initialization

_iosamps_  -- number of times of oversampling used in the filtering process. This will determine the maximum sharpness of the filter resonance (Q). More oversampling allows higher Qs, less oversampling will limit the resonance. The default is 3 times (iosamps=0).

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_ahp_ -- high-pass output signal.

_alp_ -- low-pass output signal.

_abp_ -- band-pass signal.

_abr_ -- band-reject signal.

_asig_ -- input signal.

_xcf_ -- filter cutoff frequency (k-rate or a-rate).

_xq_ -- filter Q (k-rate or a-rate). This value is limited internally depending on the frequency and the number of times of oversampling used in the process (3-times oversampling by default).

## Examples

Here is an example of the statevar opcode. It uses the file [statevar.csd](../examples/statevar.csd).

``` csound-csd title="Example of the statevar opcode." linenums="1"
--8<-- "examples/statevar.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Victor Lazzarini<br>
January 2005<br>

New plugin in version 5

January 2005.

Audio rate parameters introduced in version 6.02

October 2013.
