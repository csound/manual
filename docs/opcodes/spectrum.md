<!--
id:spectrum
category:Spectral Processing:Non-Standard
-->
# spectrum
Generate a constant-Q, exponentially-spaced DFT across all octaves of a multiply-downsampled control or audio input signal.

## Syntax
=== "Modern"
    ``` csound-orc
    wsig = spectrum(xsig, iprd, iocts, ifrqa [, iq] [, ihann] [, idbout] \
                    [, idsprd] [, idsinrs])
    ```

=== "Classic"
    ``` csound-orc
    wsig spectrum xsig, iprd, iocts, ifrqa [, iq] [, ihann] [, idbout] \
                  [, idsprd] [, idsinrs]
    ```

### Initialization

_ihann_ (optional) -- apply a Hamming or Hanning window to the input. The default is 0 (Hamming window)

_idbout_ (optional) -- coded conversion of the DFT output:

*  0 = magnitude
*  1 = dB
*  2 = mag squared
*  3 = root magnitude

The default value is 0 (magnitude).

_idisprd_ (optional) -- if non-zero, display the composite downsampling buffer every _idisprd_ seconds.  The default value is 0 (no display).

_idsines_ (optional) -- if non-zero, display the Hamming or Hanning windowed sinusoids used in DFT filtering.  The default value is 0 (no sinusoid display).

### Performance

This unit first puts signal _asig_ or _ksig_ through _iocts_ of successive octave decimation and downsampling, and preserves a buffer of down-sampled values in each octave (optionally displayed as a composite buffer every _idisprd_ seconds).  Then at every _iprd_ seconds, the preserved samples are passed through a filter bank (_ifrqs_ parallel filters per octave, exponentially spaced, with frequency/bandwidth Q of _iq_), and the output magnitudes optionally converted (_idbout_) to produce a band-limited spectrum that can be read by other units.

The stages in this process are computationally intensive, and computation time varies directly with _iocts_, _ifrqs_, _iq_, and inversely with _iprd_. Settings of _ifrqs_ = 12, _iq_ = 10, _idbout_ = 3, and _iprd_ = .02 will normally be adequate, but experimentation is encouraged. _ifrqs_ currently has a maximum of 120 divisions per octave. For audio input, the frequency bins are tuned to coincide with A440.

This unit produces a self-defining spectral datablock _wsig_, whose characteristics used (_iprd_, _iocts_, _ifrqs_, _idbout_) are passed via the data block itself to all derivative _wsigs_. There can be any number of _spectrum_ units in an instrument or orchestra, but all _wsig_ names must be unique.

## Examples

``` csound-orc
asig in                                       ; get external audio
wsig spectrum  asig, 0.02, 6, 12, 33, 0, 1, 1 ; downsample in 6 octs & calc a 72 pt dft
                                              ; (Q 33, dB out) every 20 msecs
```
