<!--
id:pows
category:Array Operations: complex numbers
-->
# pows
Calculates a power spectrum from a packed real FFT array.

Use `pows` after [rfft](rfft.md) to compare the power at different frequencies. It returns the squared magnitude of each bin, including DC and Nyquist. It runs at control rate and does not perform an FFT itself.

## Syntax

=== "Modern"
    ``` csound-orc
    kpower[] = pows(kspectrum[])
    ```

=== "Classic"
    ``` csound-orc
    kpower[] pows kspectrum[]
    ```

### Performance

`kspectrum[]` is an initialized, one-dimensional k-rate array in the packed format returned by the k-array form of `rfft`. Its length `N` must be even and at least 2. `pows` does not require a power-of-two length.

`kpower[]` is a one-dimensional k-rate array with `N/2 + 1` elements. The opcode allocates its storage at initialization and calculates its values on each control cycle. Keep the input length fixed unless the output already has enough storage for the new length.

### Input layout

The first two input elements hold the real-only DC and Nyquist coefficients. The remaining elements hold real and imaginary pairs for the bins between them.

| Input index | Value |
| --- | --- |
| `0` | DC coefficient, at 0 Hz |
| `1` | Nyquist coefficient, at half the sample rate |
| `2*j` | Real part of bin `j`, for `1 <= j < N/2` |
| `2*j + 1` | Imaginary part of bin `j`, for `1 <= j < N/2` |

The output places the bins in frequency order. For an FFT of samples at rate `sr`, output bin `j` represents `j*sr/N` Hz.

| Output index | Calculation |
| --- | --- |
| `0` | `kspectrum[0] * kspectrum[0]` |
| `j`, for `1 <= j < N/2` | `kspectrum[2*j]^2 + kspectrum[2*j + 1]^2` |
| `N/2` | `kspectrum[1] * kspectrum[1]` |

For example, the packed input `[2, -3, 3, 4, 0, -2, -5, 0]` produces `[4, 25, 4, 25, 9]`. The Nyquist value moves from the second input element to the last output element.

Pass the packed k-array output of `rfft`, not a `Complex[]` array, the full complex output of [fft](fft.md), or magnitude and phase pairs.

### Scaling

The results are squared magnitudes, as if each value from [mags](mags.md) had been squared. They are not in decibels. `pows` does not divide by the FFT size, adjust for a window or double the interior bins of the one-sided spectrum. Apply the scaling your analysis needs if you want mean-square values or power per Hz.

For a fixed FFT size and window, doubling a tone's amplitude gives four times the power in its bin.

## Examples

The example compares two tones in a 64-sample block. At 48000 Hz, the first tone is 750 Hz with amplitude 0.5 and the second is 1500 Hz with amplitude 0.25. Both fit whole cycles in the block, so no window is needed for this comparison.

The printed bin powers are 256 and 64. Their ratio is 4, matching the square of the amplitude ratio. The example prints the result and makes no sound.

It uses [pows.csd](../examples/pows.csd).

``` csound-csd title="Compare the power of two tones" linenums="1"
--8<-- "examples/pows.csd"
```

## See also

[rfft](rfft.md), [mags](mags.md), [phs](phs.md), [window](window.md), [Array-based spectral opcodes](../spectral/arrays.md)

## Credits

Author Victor Lazzarini, 2016.

New in Csound 6.08.
