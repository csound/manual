<!--
id:quadosc
category:Signal Generators:Basic Oscillators
-->
# quadosc
Generates a quadrature oscillator as an array of complex samples.

The real and imaginary parts form a cosine and sine pair, separated by a quarter cycle. Use them for complex modulation or extract two audio signals with [real](real.md) and [imag](imag.md). No user-supplied function table is needed.

## Syntax

=== "Modern"
    ``` csound-orc
    signal:Complex[] = quadosc(kfreq [, ipolar [, iskip]])
    signal:Complex[] = quadosc(afreq [, ipolar [, iskip]])
    ```

=== "Classic"
    ``` csound-orc
    signal:Complex[] quadosc kfreq [, ipolar [, iskip]]
    signal:Complex[] quadosc afreq [, ipolar [, iskip]]
    ```

### Initialization

`ipolar` selects the stored form of each complex sample. It defaults to 0, for rectangular form with real and imaginary components. Use 1 for polar form with magnitude and phase. Both forms describe the same oscillator. The functions `real` and `imag` return the corresponding components in either mode.

`iskip` defaults to 0, which resets the oscillator to phase zero. A nonzero value keeps its phase state during reinitialization. Use 0 on first initialization and keep the same `ipolar` setting when retaining state.

### Performance

`kfreq` or `afreq` sets the frequency in Hz. The k-rate form uses one frequency throughout each control block. The audio-rate form accepts a separate frequency for each sample. Frequency changes keep the phase continuous.

Zero frequency holds the current phase. Negative frequency reverses the direction of rotation. Keep the frequency between `-sr/2` and `sr/2` to avoid aliasing. The opcode does not clamp it to that range.

`signal` is a one-dimensional `Complex` array with `ksmps` elements, one for each audio sample in the current block. It updates at performance time. Extract audio with an audio-rate result, such as `aCos = real(signal)` and `aSin = imag(signal)`.

The oscillator advances its phase before writing each sample. After a reset, its first active sample has phase `2*pi*frequency/sr` radians. With constant frequency, later samples continue in equal phase steps. There is no initial-phase argument.

Polar mode stores magnitude 1 and wraps phase to the range from `-pi` inclusive to `pi` exclusive. Rectangular mode rotates the previous complex value and can accumulate small numerical changes in magnitude over long runs. Scale the output to set its level.

With sample-accurate note timing, elements before the note starts or after it ends within a block are zero. The oscillator advances only through active samples.

## Examples

The example sends the cosine component to the left channel and the sine component to the right. Each note rises from 220 to 440 Hz. The first uses rectangular storage and the second uses polar storage, with the same extraction code for both.

It uses [quadosc.csd](../examples/quadosc.csd).

``` csound-csd title="Play the real and imaginary parts of a complex oscillator" linenums="1"
--8<-- "examples/quadosc.csd"
```

## See also

[real](real.md), [imag](imag.md), [hilbert](hilbert.md), [Complex Arithmetic and Operators](../math/complex.md), [Basic Oscillators](../siggen/basic.md)

## Credits

Author Victor Lazzarini, 2026.

New in Csound 7.
