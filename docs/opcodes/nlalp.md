<!--
id:nlalp
category:Signal Modifiers:Specialized Filters
-->
# nlalp
Filters an audio signal with a nonlinear first-order all-pass structure.

Use `nlalp` to add harmonics or change a signal's phase with a small feedback filter. Its controls are coefficients, not frequencies in Hz.

## Syntax

=== "Modern"
    ``` csound-orc
    aout = nlalp(ain, klinear, knonlinear [, istor])
    ```

=== "Classic"
    ``` csound-orc
    aout nlalp ain, klinear, knonlinear [, istor]
    ```

### Initialization

`istor` is optional and defaults to 0. Zero clears the internal filter state at initialization. A nonzero value skips that clearing.

### Performance

`ain` is the audio input and `aout` is the audio output.

`klinear` scales the signed internal signal. `knonlinear` scales its absolute value. Both coefficients run at control rate. The absolute-value term treats positive and negative values differently and can add harmonics to the input.

With `knonlinear` set to 0 and a fixed `klinear` between -1 and 1, the filter is a linear first-order all-pass filter. It changes phase while preserving the magnitude of each frequency in steady state. With a nonzero nonlinear coefficient, do not expect that flat magnitude response or unchanged peak levels.

Keep `abs(klinear) + abs(knonlinear) < 1` as a sufficient condition for stable feedback. This keeps both internal slopes, `klinear + knonlinear` and `klinear - knonlinear`, strictly between -1 and 1. The opcode does not enforce this limit. Coefficients near the boundary can produce large internal values and long transients.

The nonlinear path is an absolute-value calculation, not a saturating clipper. Raising the input level alone does not act like increasing a distortion drive control. Use `knonlinear` to change the nonlinear effect and leave room for output peaks. The opcode does not remove harmonics above half the sample rate, so strong nonlinear settings can cause aliasing.

### Filter calculation

For each input sample, the filter computes an internal value `v` and a feedback value `f`. The subscript `previous` means the value from the preceding sample.

``` text
v = input - f_previous
f = klinear*v + knonlinear*abs(v)
output = v_previous + f
```

When `knonlinear` is 0 and `klinear` is constant, this gives the usual first-order all-pass transfer function.

``` text
H(z) = (klinear + z^-1) / (1 + klinear*z^-1)
```

## Examples

The example plays a 1000 Hz sine tone twice. The first note uses the linear filter. The second keeps the same linear coefficient and adds a nonlinear coefficient of 0.6, which adds overtones. An output envelope avoids clicks at the start and end of each note.

It uses [nlalp.csd](../examples/nlalp.csd).

``` csound-csd title="Compare linear and nonlinear filtering" linenums="1"
--8<-- "examples/nlalp.csd"
```

## See also

[phaser1](phaser1.md), [alpass](alpass.md), [nlfilt](nlfilt.md), [Specialized filters](../sigmod/speciali.md), [Waveshaping](../sigmod/wavshape.md)

## Credits

Author Jens Groh.
