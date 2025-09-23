<!--
id:plltrack
category:Instrument Control:Sensing and Control
-->
# plltrack
Tracks the pitch of a signal.

_plltrack_, a pitch tracker based on a phase-locked loop algorithm, described in Zolzer, U, Sankarababu, S.V. and Moller, S, "PLL-based Pitch Detection and Tracking for Audio Signals. Proc. of IIH-MSP 2012".

## Syntax
=== "Modern"
    ``` csound-orc
    acps, alock = plltrack(asig, kd [, kloopf, kloopq, klf, khf, kthresh])
    ```

=== "Classic"
    ``` csound-orc
    acps, alock plltrack asig, kd [, kloopf, kloopq, klf, khf, kthresh]
    ```

### Performance

_acps_ -- estimated pitch in Hz.

_alock_ -- phase lock indicator, a phase error indicating the quality of the tracking, with values between 0 and 1. Higher values indicate good tracking

_kd_ -- PLL feedback gain, controls frequency range of PLL (between 0 and 1). Higher values increase the range of the tracking.

_kloopf_ -- PLL LP filter cf, controls frequency range of PLL (opt, defaults to 20Hz).

_kloopq_ -- PLL LP filter Q, controls rise time of FO step (opt, defaults to 1/3)

_klf_ -- lowest tracking freq (opt, defaults to 20Hz)

_khf_ -- highest tracking freq (opt, defaults to 1500Hz)

_kthresh_ --  tracking signal level threshold (optional, defaults to 0.001, equiv to -60dBfs)

_plltrack_ analyzes the input signal, _asig_, estimating the fundamental of a monophonic signal. Its output is updated every sample.

## Examples

Here is an example of the plltrack operator. It uses the file [plltrack.csd](../examples/plltrack.csd).

``` csound-csd title="Example of the plltrack operator." linenums="1"
--8<-- "examples/plltrack.csd"
```

## See also

[Sensing and Control: Tempo and Pitch estimation](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
NUI, Maynooth.<br>
Maynooth, Ireland<br>
September, 2012<br>

New in Csound version 5.18.031
