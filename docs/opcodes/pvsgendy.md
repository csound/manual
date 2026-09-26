<!--
id:pvsgendy
category:Spectral Processing:Streaming
-->
# pvsgendy
Adds random changes to the frequencies in a spectral stream.

Use `pvsgendy` to turn a steady tone into a less pitched, noisier sound. It applies a Gendy-style transformation to an existing spectrum. Unlike [gendy](gendy.md), it needs an input signal rather than generating a waveform on its own.

## Syntax

=== "Modern"
    ``` csound-orc
    fout = pvsgendy(fin, kmrate, kfrate)
    ```

=== "Classic"
    ``` csound-orc
    fout pvsgendy fin, kmrate, kfrate
    ```

### Performance

`fin` is an amplitude-frequency spectral stream, such as the output of [pvsanal](pvsanal.md). `fout` has the same analysis settings as `fin`. Use different f-variables for input and output.

The opcode processes every bin, including DC and Nyquist. Set both controls to 0 to copy the full input spectrum. In sliding analysis, it clears the output samples before the note starts and after it ends within each control block.

Reinitialize `pvsgendy` if the input's analysis settings change.

`kmrate` controls the size of random amplitude changes in sliding analysis. Each bin receives an independent offset of roughly `-kmrate/2` to `kmrate/2` in linear amplitude units. In ordinary frame-based analysis, this parameter has no effect and the opcode copies the input amplitudes. Use 0 to leave amplitudes unchanged.

`kfrate` controls the size of random frequency changes in Hz. Larger values give more detuning, and lower bins receive larger offsets than higher bins. Use 0 to leave the processed bin frequencies unchanged. Neither control sets the speed of the random changes. Use nonnegative values for both controls.

The two analysis modes use different frequency ranges. In the table below, `b` is the bin index starting at 0 for DC. The bounds are approximate.

| Analysis mode | Frequency offset in each bin | When offsets change |
| --- | --- | --- |
| Ordinary frames | `±kfrate / (2 * (2*b + 1))` Hz | On each new input frame |
| Sliding analysis | `±kfrate / (2 * (b + 1))` Hz | On each audio sample |

For example, in ordinary frame-based analysis, `kfrate = 1000` gives bin 1 an offset of roughly -167 to 167 Hz. Each update adds a fresh offset to the input value. The changes do not build up from one update to the next.

Each instance has its own random sequence. Set [seed](seed.md) before the opcode initializes to make the result repeatable. Use the same seed and initialization order for repeat runs.

The opcode does not limit the resulting amplitudes or frequencies. Large settings can produce negative amplitudes in sliding mode or frequencies outside the range from 0 to `sr/2` in either mode.

## Examples

The example makes a stereo comparison from a sawtooth tone. The left channel resynthesizes the input spectrum. The right channel passes it through `pvsgendy` before resynthesis. Both channels use the same analysis, so their timing matches.

For the first two seconds, the frequency control stays at 0. It then rises to 3000 over two seconds and holds there. Listen for the right channel to lose its steady pitch. This can add a rough texture to a sustained note without changing its source oscillator.

It uses [pvsgendy.csd](../examples/pvsgendy.csd).

``` csound-csd title="Compare a steady spectrum with random frequency changes" linenums="1"
--8<-- "examples/pvsgendy.csd"
```

## See also

[pvsanal](pvsanal.md), [pvsynth](pvsynth.md), [gendy](gendy.md), [Real-time spectral processing](../spectral/realtime.md)

## Credits

Author John ffitch, 2009.
