<!--
id:pitchac
category:Instrument Control:Sensing and Control
-->
# pitchac
Estimate pitch by correlating successive windows of an audio signal.

## Syntax
=== "Modern"
    ``` csound-orc
    kpitch = pitchac(asig, kfmin, kfmax, iflow)
    ```

=== "Classic"
    ``` csound-orc
    kpitch pitchac asig, kfmin, kfmax, iflow
    ```

### Initialization

_iflow_ -- lowest frequency in Hz used to size the sample and correlation buffers. It must be positive and no greater than the sample rate, and the resulting buffer length must fit in memory. Set it at or below the smallest _kfmin_ you will use.

### Performance

_kpitch_ -- estimated frequency in Hz. It starts at zero and holds the last accepted estimate until another estimate is accepted.

_asig_ -- audio signal to analyze.

_kfmin_ -- frequency in Hz used to choose the analysis window length, approximately `sr / kfmin` samples. It must be positive and no greater than the sample rate. The requested length is limited to the capacity set by _iflow_. A change takes effect when the current window finishes. This parameter controls the window length; it is not a separate lower-bound check on the reported pitch.

_kfmax_ -- highest accepted pitch estimate in Hz. An estimate above this value leaves the previous output unchanged.

The opcode correlates the previous sample window with a circularly shifted current window. A nonzero lag gives an estimate of `sr / lag`. It updates the stored estimate after each completed window, so analysis introduces a delay. Silence or a window without an accepted nonzero lag leaves the previous estimate unchanged.

## Examples

This example prints the estimate for a sine wave:

``` csound-csd
--8<-- "examples/pitchac.csd"
```

## See also

[pitchamdf](pitchamdf.md), [ptrack](ptrack.md), [Sensing and Control](../control/sensing.md)
