<!--
id:pshifter
category:Spectral Processing:Other
-->
# pshifter
Phase-locked pitch shifting of a live audio signal, with optional formant scaling.

_pshifter_ uses the same phase-locked vocoder algorithm as [mincer](../opcodes/mincer.md), but reads from an audio input signal rather than a function table. It has no time-scaling control. The second output reports the fixed latency of the opcode, so a dry signal can be delayed by the same amount for alignment.

Formant preservation is optional. When _kkeepform_ is non-zero and the pitch or formant scaling ratio is outside the neutral range, the spectral envelope is extracted from the source frame and restored on the output frame. Formant scaling follows [pvswarp](../opcodes/pvswarp.md): setting _kfscal_ to 1 preserves the original formants, setting it to _kpitch_ leaves the naturally shifted formants, values above 1 stretch the envelope, and values below 1 compress it.

## Syntax
=== "Modern"
    ``` csound-orc
    asig, idel = pshifter(ain, kpitch, kfscal, klock, kkeepform [, ifftsize, idecim, ibeta, kcoefs])
    ```

=== "Classic"
    ``` csound-orc
    asig, idel pshifter ain, kpitch, kfscal, klock, kkeepform [, ifftsize, idecim, ibeta, kcoefs]
    ```

### Initialization

_ifftsize_ -- FFT size (power-of-two), defaults to 2048. The opcode reports a latency of _ifftsize/sr_ seconds in _idel_.

_idecim_ -- decimation, defaults to 8 (meaning hopsize = ifftsize/8). Valid values are 4 to _ifftsize_ and must divide _ifftsize_ evenly.

_ibeta_ -- scaling exponent for identity phase locking, used only when _klock_ is 3. A value of 1 (the default) selects identity phase locking.

### Performance

_ain_ -- input audio signal.

_kpitch_ -- pitch scaling ratio (1 = normal pitch, &lt; 1 lower, > 1 higher). Values are clamped to the range 0.25 to 4; non-finite or negative values are treated as 1.

_kfscal_ -- spectral envelope scaling ratio. Effective formant scaling is _kpitch / kfscal_. Values are converted to their absolute value and clamped to the range 0.25 to 4; non-finite or zero values are treated as 1. This argument has no effect when _kkeepform_ is 0.

_klock_ -- phase-locking mode: 0 disables locking; 1 selects the legacy phase-locking algorithm; 2 selects identity phase locking; 3 selects identity phase locking with the exponent given by _ibeta_. Other non-zero values use the legacy algorithm.

_kkeepform_ -- formant preservation mode: 0 disables formant preservation; 1 selects liftered cepstrum envelope extraction; 2 selects true-envelope extraction. Values are rounded half up and values of 2.5 or higher select mode 2.

_kcoefs_ -- number of cepstrum coefficients used for formant preservation (defaults to 80).

The input is held in a bounded circular buffer. The read position is recomputed from the write position on every frame, so pitch changes do not reset the overlap or formant state.

## Examples

This example shifts [fox.wav](../examples/fox.wav) by four ratios and compares formant preservation modes 0, 1 and 2. The optional FFT size and decimation are omitted, so the defaults of 2048 and 8 are used. It uses the file [pshifter.csd](../examples/pshifter.csd).

``` csound-csd title="Pitch shifting with formant preservation modes." linenums="1"
--8<-- "examples/pshifter.csd"
```

## See also

[mincer](../opcodes/mincer.md), [pvswarp](../opcodes/pvswarp.md), [Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md), [Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
November 2026<br>
