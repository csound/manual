<!--
id:ptrack
category:Instrument Control:Sensing and Control
-->
# ptrack
Tracks the pitch of a signal.

_ptrack_ takes an input signal, splits it into _ihopsize_ blocks and using a STFT method, extracts an estimated pitch for its fundamental frequency as well as estimating the total amplitude of the signal in dB, relative to full-scale (0dB). The method implies an analysis window size of 2*_ihopsize_ samples (overlaping by 1/2 window), which has to be a power-of-two, between 128 and 8192 (hopsizes between 64 and 4096). Smaller windows will give better time precision, but worse frequency accuracy (esp. in low fundamentals).This opcode is based on an original algorithm by M. Puckette.

## Syntax
=== "Modern"
    ``` csound-orc
    kcps, kamp = ptrack(asig, ihopsize[,ipeaks])
    ```

=== "Classic"
    ``` csound-orc
    kcps, kamp ptrack asig, ihopsize[,ipeaks]
    ```

### Initialization

_ihopsize_ -- size of the analysis 'hop', in samples, required to be power-of-two (min 64, max 4096). This is the period between measurements.

_ipeaks_, _ihi_ -- number of spectral peaks to use in the analysis, defaults to 20 (optional)

### Performance

_kcps_ -- estimated pitch in Hz.

_kamp_ -- estimated amplitude in dB relative to full-scale (0dB) (ie. always &lt;= 0).

_ptrack_ analyzes the input signal, _asig_, to give a pitch/amplitude pair of outputs, for the fundamental of a monophonic signal. The output is updated every _sr/ihopsize_ seconds.

## Examples

Here is an example of the ptrack opcode. This example uses the files [ptrack.csd](../examples/ptrack.csd).

``` csound-csd title="Example of the ptrack opcode." linenums="1"
--8<-- "examples/ptrack.csd"
```

## See also

[Sensing and Control: Tempo and Pitch estimation](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
NUI, Maynooth.<br>
Maynooth, Ireland<br>
March, 2007<br>

New in Csound version 5.05
