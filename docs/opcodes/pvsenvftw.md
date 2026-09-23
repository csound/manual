<!--
id:pvsenvftw
category:Spectral Processing:Streaming
-->
# pvsenvftw
Writes a smoothed spectral amplitude envelope to a function table.

Use the table to display a sound's broad spectral shape or read its level at selected frequencies. Unlike [pvsftw](pvsftw.md), which copies individual bin amplitudes, `pvsenvftw` smooths the spectrum before writing it.

## Syntax

=== "Modern"
    ``` csound-orc
    kupdate = pvsenvftw(fsrc, ktable [, kmethod [, kgain [, kcoefs]]])
    ```

=== "Classic"
    ``` csound-orc
    kupdate pvsenvftw fsrc, ktable [, kmethod [, kgain [, kcoefs]]]
    ```

### Table setup

Create the destination table before calling the opcode. For an FFT size of N, use a table with exactly `N/2` ordinary samples, excluding its guard point. For example, a 1024-point FFT needs a 512-sample table.

``` csound-orc
iEnvelope = ftgen(0, 0, 512, 2, 0)
```

The current implementation does not validate the table length. Keep this exact size rather than using a shorter or larger table. This also differs from the `N/2 + 1` amplitude bins normally used by `pvsftw`.

### Performance

`fsrc` is a frame-based amplitude spectrum, such as the output of [pvsanal](pvsanal.md). Use a fixed FFT size and the ordinary analysis mode, not a sliding DFT stream.

`ktable` is the number of the destination table. The table must exist. You can change its number at control rate, but each selected table must have the required size.

`kmethod` selects the envelope method and defaults to 1.

| Method | Behavior |
| --- | --- |
| 1 | Smooths the log spectrum by keeping the low cepstral components |
| 2 | Uses an iterative true-envelope method to follow spectral peaks |

Method 2 can take more computation than method 1. Values above 2 select an experimental smoothing path. Use 1 or 2 for the methods described here.

`kgain` scales the written envelope and defaults to 1. The values are linear amplitudes, not decibels. The opcode does not normalize the highest value to 1.

`kcoefs` controls how much cepstral detail the envelope retains. Smaller values give a smoother curve. Choose an integer from 1 to `N/2`. An omitted or nonpositive value uses 80, so choose an explicit value for small FFT sizes. This control applies to methods 1 and 2.

`kupdate` is 1 when the opcode writes a new spectral frame and 0 otherwise. The table keeps its values between updates. Changes to the table number, gain or envelope settings take effect on the next new frame.

### Table layout

Index 0 holds the envelope at DC. Index `j` corresponds to `j*sr/N` Hz. The last written index is `N/2 - 1`, one bin below the Nyquist frequency. The opcode does not write a Nyquist value or update the guard point.

The table contains only envelope amplitudes. It does not contain frequency or phase values. Read it after `pvsenvftw` has run, and use `kupdate` when further processing should happen only once per new frame.

## Examples

The example opens a low-pass filter on a sawtooth tone. It writes the changing spectral envelope to a table and prints the values at 187.5 Hz and 3000 Hz. These readings can also drive a display or another instrument parameter.

At 48000 Hz with a 1024-point FFT, each bin spans 46.875 Hz. The two readings therefore use table indices 4 and 64. The analysis hop is 256 samples, so the table updates less often than the 32-sample control cycle.

It uses [pvsenvftw.csd](../examples/pvsenvftw.csd).

``` csound-csd title="Read two frequencies from a spectral envelope" linenums="1"
--8<-- "examples/pvsenvftw.csd"
```

## See also

[pvsanal](pvsanal.md), [pvsftw](pvsftw.md), [pvswarp](pvswarp.md), [pvsceps](pvsceps.md), [Real-time spectral processing](../spectral/realtime.md)

## Credits

Author Victor Lazzarini, 2010.
