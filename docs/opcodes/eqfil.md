<!--
id:eqfil
category:Signal Modifiers:Specialized Filters
-->
# eqfil
Equalizer filter.

The opcode eqfil is a 2nd order tunable equalisation filter based on Regalia and Mitra design ("Tunable Digital Frequency Response Equalization Filters", IEEE Trans. on Ac., Sp. and Sig Proc., 35 (1), 1987). It provides a peak/notch filter for building parametric/graphic equalisers.

The amplitude response for this filter will be flat (=1) for _kgain_=1. With _kgain_ bigger than 1, there will be a peak at the centre frequency, whose width is given by the _kbw_ parameter, but outside this band, the response will tend towards 1. Conversely, if _kgain_ is smaller than 1, a notch will be created around the CF.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = eqfil(ain, kcf, kbw, kgain[, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig eqfil ain, kcf, kbw, kgain[, istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- filtered output signal.

_ain_ -- input signal.

_kcf_ -- filter centre frequency.

_kbw_ -- peak/notch bandwidth (Hz).

_kgain_ -- peak/notch gain.

## Examples

Here is an example of the eqfil opcode. It uses the file [eqfil.csd](../examples/eqfil.csd).

``` csound-csd title="Example of the eqfil opcode." linenums="1"
--8<-- "examples/eqfil.csd"
```

## See also

[Specialized Filters: Parametric EQ](../sigmod/speciali.md)

## Credits

Author: Victor Lazzarini<br>
April 2007<br>

New in version 5.06
